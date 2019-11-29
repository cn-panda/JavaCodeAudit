package com.ofsoft.cms.core.uitle;

import java.io.InputStream;
import java.lang.annotation.Annotation;
import java.lang.reflect.Constructor;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;

/**
 * @author OF
 * @version v1.0
 * @className ClassUtile
 * @date 2018/8/15
 */
public class ClassUtile {

    public static Object newInstance(Class clazz) {
        if (clazz == null) {
            String msg = "Class method parameter cannot be null.";
            throw new IllegalArgumentException(msg);
        }
        try {
            return clazz.newInstance();
        } catch (Exception e) {
            return null;
        }
    }

    public static Object newInstance(Class clazz, Object... args) {
        Class[] argTypes = new Class[args.length];
        for (int i = 0; i < args.length; i++) {
            argTypes[i] = args[i].getClass();
        }
        Constructor ctor = getConstructor(clazz, argTypes);
        return instantiate(ctor, args);
    }

    public static Constructor getConstructor(Class clazz, Class... argTypes) {
        try {
            return clazz.getConstructor(argTypes);
        } catch (NoSuchMethodException e) {
            throw new IllegalStateException(e);
        }

    }

    public static Object instantiate(Constructor ctor, Object... args) {
        try {
            return ctor.newInstance(args);
        } catch (Exception e) {
            return null;
        }
    }

    /**
     * @param type
     * @param annotation
     * @return
     * @since 1.3
     */
    public static List<Method> getAnnotatedMethods(final Class<?> type, final Class<? extends Annotation> annotation) {
        final List<Method> methods = new ArrayList<Method>();
        Class<?> clazz = type;
        while (!Object.class.equals(clazz)) {
            Method[] currentClassMethods = clazz.getDeclaredMethods();
            for (final Method method : currentClassMethods) {
                if (annotation == null || method.isAnnotationPresent(annotation)) {
                    methods.add(method);
                }
            }
            // move to the upper class in the hierarchy in search for more methods
            clazz = clazz.getSuperclass();
        }
        return methods;
    }

    /**
     * @since 1.0
     */
    private static interface ClassLoaderAccessor {
        Class loadClass(String fqcn);

        InputStream getResourceStream(String name);
    }
}
