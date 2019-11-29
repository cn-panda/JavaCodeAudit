package com.ofsoft.cms.core.route;

import com.google.common.base.Preconditions;
import com.google.common.collect.Lists;
import com.jfinal.config.Routes;
import com.jfinal.core.Controller;
import com.jfinal.kit.StrKit;
import com.ofsoft.cms.core.annotation.Action;
import com.ofsoft.cms.core.annotation.ClassSearcher;
import org.apache.log4j.Logger;

import java.util.List;

/**
 * 注解路由处理
 * 
 * @author OF
 * @date 2017年11月23日
 */
public class AutoBindRoutes extends Routes {
	/**
	 * 是否自动获取
	 */
	private boolean autoScan = true;

	private List<Class<? extends Controller>> excludeClasses = Lists
			.newArrayList();
	/**
	 * 是否加载所用jar包
	 */
	private boolean includeAllJarsInLib;
	/**
	 * 加载jar包
	 */
	private List<String> includeJars = Lists.newArrayList();

	private Logger logger = Logger.getLogger(AutoBindRoutes.class);
	/**
	 * 默认后缀名
	 */
	private String suffix = "Controller";
	/**
	 * 默认前缀
	 */
	private String baseViewPath = "";
	/**
	 * 加载包路径
	 */
	private String packagePath = null;
	/**
	 * 加载多个包路径
	 */
	private List<String> scanPackages = Lists.newArrayList();

	public AutoBindRoutes(boolean autoScan) {
		this.autoScan = autoScan;
	}

	/**
	 * @param packagePath
	 *            扫描包路径
	 */
	public AutoBindRoutes(String packagePath) {
		this.packagePath = packagePath;
	}

	/**
	 * 
	 * @param scanPackages
	 *            多个扫描包路径
	 */
	public AutoBindRoutes(String[] scanPackages) {
		for (int i = 0; i < scanPackages.length; i++) {
			this.scanPackages.add(scanPackages[i]);
		}
	}

	/**
	 * @param baseViewPath
	 *            默认路径
	 * @param packageName
	 *            扫描包路径
	 */
	public AutoBindRoutes(String baseViewPath, String packageName) {
		this.baseViewPath = baseViewPath;
		this.packagePath = packageName;
	}

	/**
	 * @param baseViewPath
	 *            默认路径
	 * @param packageName
	 *            扫描包路径
	 * @param suffix
	 *            默认类后缀名
	 */
	public AutoBindRoutes(String baseViewPath, String packageName, String suffix) {
		this.baseViewPath = baseViewPath;
		this.packagePath = packageName;
		this.suffix = suffix;
	}

	/**
	 * @param baseViewPath
	 *            默认路径
	 * @param packageName
	 *            扫描包路径
	 * @param autoScan
	 *            是否自动处理没有注解的类
	 * @param suffix
	 *            默认类后缀名
	 */
	public AutoBindRoutes(String baseViewPath, String packageName,
			boolean autoScan, String suffix) {
		this.baseViewPath = baseViewPath;
		this.packagePath = packageName;
		this.autoScan = autoScan;
		this.suffix = suffix;
	}

	public AutoBindRoutes() {
	}

	public AutoBindRoutes autoScan(boolean autoScan) {
		this.autoScan = autoScan;
		return this;
	}

	@SuppressWarnings("unchecked")
	public AutoBindRoutes addExcludeClasses(
			Class<? extends Controller>... clazzes) {
		if (clazzes != null) {
			for (Class<? extends Controller> clazz : clazzes) {
				excludeClasses.add(clazz);
			}
		}
		return this;
	}

	public AutoBindRoutes addExcludeClasses(
			List<Class<? extends Controller>> clazzes) {
		excludeClasses.addAll(clazzes);
		return this;
	}

	public AutoBindRoutes addJars(String... jars) {
		if (jars != null) {
			for (String jar : jars) {
				includeJars.add(jar);
			}
		}
		return this;
	}

	@Override
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public void config() {
		List<Class<? extends Controller>> controllerClasses = ClassSearcher
				.of(Controller.class).includeAllJarsInLib(includeAllJarsInLib)
				.injars(includeJars).scanPackages(packagePath).search();
		Action action = null;
		for (Class controller : controllerClasses) {
			if (excludeClasses.contains(controller)) {
				continue;
			}
			action = (Action) controller.getAnnotation(Action.class);
			if (action == null) {
				if (!autoScan) {
					continue;
				}
				this.add(baseViewPath+controllerKey(controller), controller);
				System.out.println("routes.add(" + baseViewPath+controllerKey(controller) + ", "
						+ controller.getName() + ")");
			} else if (StrKit.isBlank(action.viewPath())) {
				this.add(baseViewPath+action.path(), controller);
				System.out.println("routes.add(" + baseViewPath+ action.path() + ", "
						+ controller.getName() + ")");
			} else {
				this.add(baseViewPath+action.path(), controller, action.viewPath());
				System.out.println("routes.add(" + baseViewPath+ action.path() + ", " + controller
						+ "," + action.viewPath() + ")");
			}
		}
	}

	private String controllerKey(Class<Controller> clazz) {
		Preconditions.checkArgument(clazz.getSimpleName().endsWith(suffix),
				clazz.getName()
						+ " is not annotated with @Action and not end with "
						+ suffix);
		String controllerKey = "/"
				+ StrKit.firstCharToLowerCase(clazz.getSimpleName());
		controllerKey = controllerKey.substring(0,
				controllerKey.indexOf(suffix));
		return controllerKey;
	}

	public AutoBindRoutes includeAllJarsInLib(boolean includeAllJarsInLib) {
		this.includeAllJarsInLib = includeAllJarsInLib;
		return this;
	}

	/**
	 * 后缀名
	 * 
	 * @param suffix
	 * @return
	 */
	public AutoBindRoutes suffix(String suffix) {
		this.suffix = suffix;
		return this;
	}

}
