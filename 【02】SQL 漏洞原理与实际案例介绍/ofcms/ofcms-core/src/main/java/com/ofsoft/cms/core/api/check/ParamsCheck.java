package com.ofsoft.cms.core.api.check;

import java.lang.annotation.*;

@Inherited
@Retention(RetentionPolicy.RUNTIME)
@Target({ ElementType.METHOD })
public @interface ParamsCheck {
    ParamsCheckType [] value() default {};
}