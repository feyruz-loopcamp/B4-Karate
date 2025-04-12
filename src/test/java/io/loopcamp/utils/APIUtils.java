package io.loopcamp.utils;

import com.github.javafaker.Faker;

public class APIUtils {

    public static String randomName (){
        Faker faker = new Faker();
        String firstName = faker.name().firstName();
        return firstName;
    }
}
