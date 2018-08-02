# HermaFx.SwaggerGen
Swagger C# client generation

Generates C# clients with NSwag based on json files included in the solution.

* Files as Content or None with *.swagger.json will be generated as *.swagger.cs
* *.swagger.cs file will be included in the project as Compile
* Client generation can be parameterised with a *.swagger.config file as Content or None in the same path as the *.swagger.cs file. Parameters are:
    * NAMESPACE (defaults as $(RootNamespace).FileName)
    * CLASSNAME (defaults as FileName)
    * GENERATESYNC (defaults as true)
    * INJECTHTTPCLIENT (defaults as false)
    * CLASSTYLE (defaults as Poco)
