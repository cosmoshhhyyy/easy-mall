package com.qcby.util;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileReader;
import java.io.FileWriter;

/**
 * 代码生成器执行类
 */
public class SourceGenerator {
    public static void main(String[] args) throws Exception {
        generatorSource("Product");
    }

    public static void generatorSource(String objName) throws Exception{
        generateQuery(objName);
        generateDao(objName);
        generateService(objName);
        generateServiceImpl(objName);
    }


    public static void generateQuery(String objName) throws Exception{
        //EbItem
        //创建文件输入流
        BufferedReader br = new BufferedReader(new FileReader("easy_core/src/test/resources/tpl/DemoQuery.tpl"));
        BufferedWriter bw = new BufferedWriter(new FileWriter("easy_core/src/main/java/com/qcby/query/"+objName+"Query.java"));
        String line = null;
        while((line = br.readLine()) != null){
            line = line.replace("Demo", objName);
            bw.write(line);
            bw.newLine();

        }
        bw.close();
        br.close();
    }

    public static void generateDao(String objName) throws Exception{
        //EbItem
        //创建文件输入流
        BufferedReader br = new BufferedReader(new FileReader("easy_core/src/test/resources/tpl/DemoMapper.tpl"));
        BufferedWriter bw = new BufferedWriter(new FileWriter("easy_core/src/main/java/com/qcby/dao/"+objName+"Mapper.java"));
        String line = null;
        while((line = br.readLine()) != null){
            line = line.replace("Demo", objName);
            bw.write(line);
            bw.newLine();

        }
        bw.close();
        br.close();
    }
    public static void generateService(String objName) throws Exception{
        //EbItem
        //创建文件输入流
        BufferedReader br = new BufferedReader(new FileReader("easy_core/src/test/resources/tpl/DemoService.tpl"));
        BufferedWriter bw = new BufferedWriter(new FileWriter("easy_core/src/main/java/com/qcby/service/"+objName+"Service.java"));
        String line = null;
        while((line = br.readLine()) != null){
            line = line.replace("Demo", objName);
            bw.write(line);
            bw.newLine();

        }
        bw.close();
        br.close();
    }
    public static void generateServiceImpl(String objName) throws Exception{

        //把传递过来的实体类的名字改成小写一份
        String lowerObjName = objName.substring(0, 1).toLowerCase()+objName.substring(1, objName.length());

        //EbItem
        //创建文件输入流
        BufferedReader br = new BufferedReader(new FileReader("easy_core/src/test/resources/tpl/DemoServiceImpl.tpl"));
        BufferedWriter bw = new BufferedWriter(new FileWriter("easy_core/src/main/java/com/qcby/service/impl/"+objName+"ServiceImpl.java"));
        String line = null;
        while((line = br.readLine()) != null){
            line = line.replace("Demo", objName);
            line = line.replace("demo", lowerObjName);
            bw.write(line);
            bw.newLine();
        }
        bw.close();
        br.close();
    }
}
