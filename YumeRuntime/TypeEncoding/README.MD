[Type Encodings](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/ObjCRuntimeGuide/Articles/ocrtTypeEncodings.html#//apple_ref/doc/uid/TP40008048-CH100-SW1)


``` objc
char *buf1 = @encode(int **);

char *buf2 = @encode(struct key);

char *buf3 = @encode(Rectangle);
```

|Code|Meaning|
|:---|:------|
|c|A char|
|i|An int|
|s|A short|
|l|A long<br />依系統 32/64 bit 決定|
|q|A long long|


|Code|Meaning|
|:---|:------|
|C|An unsigned char|
|I|An unsigned int|
|S|An unsigned short|
|L|An unsigned long|
|Q|An unsigned long long|


|f|A float|
|d|A double|


|B|A C++ bool or a C99 _Bool|
|v|A void|
|*|A character string (char *)|
|@|An object (whether statically typed or typed id)|
|#|A class object (Class)|
|:|A method selector (SEL)|


|[array type]|An array|
|{name=type...}|A structure|
|(name=type...)|A union|
|bnum|A bit field of num bits|
|^type|A pointer to type|
|?|An unknown type (among other things, this code is used for function pointers)|


Objective-C method encodings
|r|const|
|n|in|
|N|inout|
|o|out|
|O|bycopy|
|R|byref|
|V|oneway|

``` c
typedef struct example {
    id   anObject; // @
    char *aString; // *
    int  anInt; // i
} Example;
// {example=@*i}
```

```
@encode(NSObject)
// {NSObject=#}
```
