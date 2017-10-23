# BDLocalizedDevicesModels
Apple devices model names localized.

You can use strings files to match the device platform code to the device model.

## Platform code
You can get the platform code with:
```objc
size_t size;
sysctlbyname("hw.machine", NULL, &size, NULL, 0);
char *machine = malloc(size);
sysctlbyname("hw.machine", machine, &size, NULL, 0);

NSString *platform = [NSString stringWithCString:machine encoding:NSUTF8StringEncoding];
free(machine);
```
