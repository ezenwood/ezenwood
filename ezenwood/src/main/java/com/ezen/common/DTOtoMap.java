package com.ezen.common;

import java.lang.reflect.Field;
import java.util.HashMap;
import java.util.Map;

public class DTOtoMap {
	public static Map<String, Object> toMap(Object obj) {

        Field[] fields = obj.getClass().getDeclaredFields();
        
        
        

        Map<String, Object> result = new HashMap<String, Object>();

       

        for ( int i = 0; i < fields.length; ++i ) {

                try {



                       result.put(fields[i].getName(), fields[i].get(obj));

               } catch (IllegalArgumentException e) {

                       e.printStackTrace();

                       return null;

                } catch (IllegalAccessException e) {

                       e.printStackTrace();

                       return null;

                }

        }

        return result;

}


}
