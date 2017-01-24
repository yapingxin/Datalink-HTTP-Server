##
## Auto Generated makefile by CodeLite IDE
## any manual changes will be erased      
##
## Debug
ProjectName            :=HTTP-Server
ConfigurationName      :=Debug
WorkspacePath          :=/home/yaping/DevSpace/Datalink-HTTP-Server/Dev
ProjectPath            :=/home/yaping/DevSpace/Datalink-HTTP-Server/Dev
IntermediateDirectory  :=./Debug
OutDir                 := $(IntermediateDirectory)
CurrentFileName        :=
CurrentFilePath        :=
CurrentFileFullPath    :=
User                   :=Yaping Xin
Date                   :=24/01/17
CodeLitePath           :=/home/yaping/.codelite
LinkerName             :=gcc
SharedObjectLinkerName :=gcc -shared -fPIC
ObjectSuffix           :=.o
DependSuffix           :=.o.d
PreprocessSuffix       :=.o.i
DebugSwitch            :=-g 
IncludeSwitch          :=-I
LibrarySwitch          :=-l
OutputSwitch           :=-o 
LibraryPathSwitch      :=-L
PreprocessorSwitch     :=-D
SourceSwitch           :=-c 
OutputFile             :=$(IntermediateDirectory)/$(ProjectName)
Preprocessors          :=
ObjectSwitch           :=-o 
ArchiveOutputSwitch    := 
PreprocessOnlySwitch   :=-E 
ObjectsFileList        :="HTTP-Server.txt"
PCHCompileFlags        :=
MakeDirCommand         :=mkdir -p
LinkOptions            :=  -pthread
IncludePath            :=  $(IncludeSwitch). $(IncludeSwitch). $(IncludeSwitch)src/lib/C-Thread-Pool 
IncludePCH             := 
RcIncludePath          := 
Libs                   := 
ArLibs                 :=  
LibPath                := $(LibraryPathSwitch). 

##
## Common variables
## AR, CXX, CC, AS, CXXFLAGS and CFLAGS can be overriden using an environment variables
##
AR       := ar rcus
CXX      := gcc
CC       := gcc
CXXFLAGS :=  -g -O0 -Wall $(Preprocessors)
CFLAGS   :=  -g -O0 -Wall $(Preprocessors)
ASFLAGS  := 
AS       := as


##
## User defined environment variables
##
CodeLiteDir:=/usr/share/codelite
Objects0=$(IntermediateDirectory)/src_HTTP-Server.c$(ObjectSuffix) $(IntermediateDirectory)/src_lib_C-Thread-Pool_thpool.c$(ObjectSuffix) $(IntermediateDirectory)/src_lib_HTTP-Parser_http_parser.c$(ObjectSuffix) $(IntermediateDirectory)/src_lib_C-Thread-Pool_test_test1.c$(ObjectSuffix) $(IntermediateDirectory)/src_lib_C-Thread-Pool_test_test2.c$(ObjectSuffix) $(IntermediateDirectory)/src_lib_LGPL_iLOG3_LOG.c$(ObjectSuffix) $(IntermediateDirectory)/src_lib_LGPL_iLOG3_LOGCONF.c$(ObjectSuffix) $(IntermediateDirectory)/src_lib_LGPL_iLOG3_LOGS.c$(ObjectSuffix) $(IntermediateDirectory)/src_lib_LGPL_iLOG3_LOGSCONF.c$(ObjectSuffix) $(IntermediateDirectory)/src_lib_LGPL_iLOG3_test_test_config.c$(ObjectSuffix) \
	$(IntermediateDirectory)/src_lib_LGPL_iLOG3_test_test_demo.c$(ObjectSuffix) 



Objects=$(Objects0) 

##
## Main Build Targets 
##
.PHONY: all clean PreBuild PrePreBuild PostBuild MakeIntermediateDirs
all: $(OutputFile)

$(OutputFile): $(IntermediateDirectory)/.d $(Objects) 
	@$(MakeDirCommand) $(@D)
	@echo "" > $(IntermediateDirectory)/.d
	@echo $(Objects0)  > $(ObjectsFileList)
	$(LinkerName) $(OutputSwitch)$(OutputFile) @$(ObjectsFileList) $(LibPath) $(Libs) $(LinkOptions)

MakeIntermediateDirs:
	@test -d ./Debug || $(MakeDirCommand) ./Debug


$(IntermediateDirectory)/.d:
	@test -d ./Debug || $(MakeDirCommand) ./Debug

PreBuild:


##
## Objects
##
$(IntermediateDirectory)/src_HTTP-Server.c$(ObjectSuffix): src/HTTP-Server.c $(IntermediateDirectory)/src_HTTP-Server.c$(DependSuffix)
	$(CC) $(SourceSwitch) "/home/yaping/DevSpace/Datalink-HTTP-Server/Dev/src/HTTP-Server.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/src_HTTP-Server.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/src_HTTP-Server.c$(DependSuffix): src/HTTP-Server.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/src_HTTP-Server.c$(ObjectSuffix) -MF$(IntermediateDirectory)/src_HTTP-Server.c$(DependSuffix) -MM src/HTTP-Server.c

$(IntermediateDirectory)/src_HTTP-Server.c$(PreprocessSuffix): src/HTTP-Server.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/src_HTTP-Server.c$(PreprocessSuffix) src/HTTP-Server.c

$(IntermediateDirectory)/src_lib_C-Thread-Pool_thpool.c$(ObjectSuffix): src/lib/C-Thread-Pool/thpool.c $(IntermediateDirectory)/src_lib_C-Thread-Pool_thpool.c$(DependSuffix)
	$(CC) $(SourceSwitch) "/home/yaping/DevSpace/Datalink-HTTP-Server/Dev/src/lib/C-Thread-Pool/thpool.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/src_lib_C-Thread-Pool_thpool.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/src_lib_C-Thread-Pool_thpool.c$(DependSuffix): src/lib/C-Thread-Pool/thpool.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/src_lib_C-Thread-Pool_thpool.c$(ObjectSuffix) -MF$(IntermediateDirectory)/src_lib_C-Thread-Pool_thpool.c$(DependSuffix) -MM src/lib/C-Thread-Pool/thpool.c

$(IntermediateDirectory)/src_lib_C-Thread-Pool_thpool.c$(PreprocessSuffix): src/lib/C-Thread-Pool/thpool.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/src_lib_C-Thread-Pool_thpool.c$(PreprocessSuffix) src/lib/C-Thread-Pool/thpool.c

$(IntermediateDirectory)/src_lib_HTTP-Parser_http_parser.c$(ObjectSuffix): src/lib/HTTP-Parser/http_parser.c $(IntermediateDirectory)/src_lib_HTTP-Parser_http_parser.c$(DependSuffix)
	$(CC) $(SourceSwitch) "/home/yaping/DevSpace/Datalink-HTTP-Server/Dev/src/lib/HTTP-Parser/http_parser.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/src_lib_HTTP-Parser_http_parser.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/src_lib_HTTP-Parser_http_parser.c$(DependSuffix): src/lib/HTTP-Parser/http_parser.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/src_lib_HTTP-Parser_http_parser.c$(ObjectSuffix) -MF$(IntermediateDirectory)/src_lib_HTTP-Parser_http_parser.c$(DependSuffix) -MM src/lib/HTTP-Parser/http_parser.c

$(IntermediateDirectory)/src_lib_HTTP-Parser_http_parser.c$(PreprocessSuffix): src/lib/HTTP-Parser/http_parser.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/src_lib_HTTP-Parser_http_parser.c$(PreprocessSuffix) src/lib/HTTP-Parser/http_parser.c

$(IntermediateDirectory)/src_lib_C-Thread-Pool_test_test1.c$(ObjectSuffix): src/lib/C-Thread-Pool/test/test1.c $(IntermediateDirectory)/src_lib_C-Thread-Pool_test_test1.c$(DependSuffix)
	$(CC) $(SourceSwitch) "/home/yaping/DevSpace/Datalink-HTTP-Server/Dev/src/lib/C-Thread-Pool/test/test1.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/src_lib_C-Thread-Pool_test_test1.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/src_lib_C-Thread-Pool_test_test1.c$(DependSuffix): src/lib/C-Thread-Pool/test/test1.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/src_lib_C-Thread-Pool_test_test1.c$(ObjectSuffix) -MF$(IntermediateDirectory)/src_lib_C-Thread-Pool_test_test1.c$(DependSuffix) -MM src/lib/C-Thread-Pool/test/test1.c

$(IntermediateDirectory)/src_lib_C-Thread-Pool_test_test1.c$(PreprocessSuffix): src/lib/C-Thread-Pool/test/test1.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/src_lib_C-Thread-Pool_test_test1.c$(PreprocessSuffix) src/lib/C-Thread-Pool/test/test1.c

$(IntermediateDirectory)/src_lib_C-Thread-Pool_test_test2.c$(ObjectSuffix): src/lib/C-Thread-Pool/test/test2.c $(IntermediateDirectory)/src_lib_C-Thread-Pool_test_test2.c$(DependSuffix)
	$(CC) $(SourceSwitch) "/home/yaping/DevSpace/Datalink-HTTP-Server/Dev/src/lib/C-Thread-Pool/test/test2.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/src_lib_C-Thread-Pool_test_test2.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/src_lib_C-Thread-Pool_test_test2.c$(DependSuffix): src/lib/C-Thread-Pool/test/test2.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/src_lib_C-Thread-Pool_test_test2.c$(ObjectSuffix) -MF$(IntermediateDirectory)/src_lib_C-Thread-Pool_test_test2.c$(DependSuffix) -MM src/lib/C-Thread-Pool/test/test2.c

$(IntermediateDirectory)/src_lib_C-Thread-Pool_test_test2.c$(PreprocessSuffix): src/lib/C-Thread-Pool/test/test2.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/src_lib_C-Thread-Pool_test_test2.c$(PreprocessSuffix) src/lib/C-Thread-Pool/test/test2.c

$(IntermediateDirectory)/src_lib_LGPL_iLOG3_LOG.c$(ObjectSuffix): src/lib/LGPL/iLOG3/LOG.c $(IntermediateDirectory)/src_lib_LGPL_iLOG3_LOG.c$(DependSuffix)
	$(CC) $(SourceSwitch) "/home/yaping/DevSpace/Datalink-HTTP-Server/Dev/src/lib/LGPL/iLOG3/LOG.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/src_lib_LGPL_iLOG3_LOG.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/src_lib_LGPL_iLOG3_LOG.c$(DependSuffix): src/lib/LGPL/iLOG3/LOG.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/src_lib_LGPL_iLOG3_LOG.c$(ObjectSuffix) -MF$(IntermediateDirectory)/src_lib_LGPL_iLOG3_LOG.c$(DependSuffix) -MM src/lib/LGPL/iLOG3/LOG.c

$(IntermediateDirectory)/src_lib_LGPL_iLOG3_LOG.c$(PreprocessSuffix): src/lib/LGPL/iLOG3/LOG.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/src_lib_LGPL_iLOG3_LOG.c$(PreprocessSuffix) src/lib/LGPL/iLOG3/LOG.c

$(IntermediateDirectory)/src_lib_LGPL_iLOG3_LOGCONF.c$(ObjectSuffix): src/lib/LGPL/iLOG3/LOGCONF.c $(IntermediateDirectory)/src_lib_LGPL_iLOG3_LOGCONF.c$(DependSuffix)
	$(CC) $(SourceSwitch) "/home/yaping/DevSpace/Datalink-HTTP-Server/Dev/src/lib/LGPL/iLOG3/LOGCONF.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/src_lib_LGPL_iLOG3_LOGCONF.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/src_lib_LGPL_iLOG3_LOGCONF.c$(DependSuffix): src/lib/LGPL/iLOG3/LOGCONF.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/src_lib_LGPL_iLOG3_LOGCONF.c$(ObjectSuffix) -MF$(IntermediateDirectory)/src_lib_LGPL_iLOG3_LOGCONF.c$(DependSuffix) -MM src/lib/LGPL/iLOG3/LOGCONF.c

$(IntermediateDirectory)/src_lib_LGPL_iLOG3_LOGCONF.c$(PreprocessSuffix): src/lib/LGPL/iLOG3/LOGCONF.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/src_lib_LGPL_iLOG3_LOGCONF.c$(PreprocessSuffix) src/lib/LGPL/iLOG3/LOGCONF.c

$(IntermediateDirectory)/src_lib_LGPL_iLOG3_LOGS.c$(ObjectSuffix): src/lib/LGPL/iLOG3/LOGS.c $(IntermediateDirectory)/src_lib_LGPL_iLOG3_LOGS.c$(DependSuffix)
	$(CC) $(SourceSwitch) "/home/yaping/DevSpace/Datalink-HTTP-Server/Dev/src/lib/LGPL/iLOG3/LOGS.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/src_lib_LGPL_iLOG3_LOGS.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/src_lib_LGPL_iLOG3_LOGS.c$(DependSuffix): src/lib/LGPL/iLOG3/LOGS.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/src_lib_LGPL_iLOG3_LOGS.c$(ObjectSuffix) -MF$(IntermediateDirectory)/src_lib_LGPL_iLOG3_LOGS.c$(DependSuffix) -MM src/lib/LGPL/iLOG3/LOGS.c

$(IntermediateDirectory)/src_lib_LGPL_iLOG3_LOGS.c$(PreprocessSuffix): src/lib/LGPL/iLOG3/LOGS.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/src_lib_LGPL_iLOG3_LOGS.c$(PreprocessSuffix) src/lib/LGPL/iLOG3/LOGS.c

$(IntermediateDirectory)/src_lib_LGPL_iLOG3_LOGSCONF.c$(ObjectSuffix): src/lib/LGPL/iLOG3/LOGSCONF.c $(IntermediateDirectory)/src_lib_LGPL_iLOG3_LOGSCONF.c$(DependSuffix)
	$(CC) $(SourceSwitch) "/home/yaping/DevSpace/Datalink-HTTP-Server/Dev/src/lib/LGPL/iLOG3/LOGSCONF.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/src_lib_LGPL_iLOG3_LOGSCONF.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/src_lib_LGPL_iLOG3_LOGSCONF.c$(DependSuffix): src/lib/LGPL/iLOG3/LOGSCONF.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/src_lib_LGPL_iLOG3_LOGSCONF.c$(ObjectSuffix) -MF$(IntermediateDirectory)/src_lib_LGPL_iLOG3_LOGSCONF.c$(DependSuffix) -MM src/lib/LGPL/iLOG3/LOGSCONF.c

$(IntermediateDirectory)/src_lib_LGPL_iLOG3_LOGSCONF.c$(PreprocessSuffix): src/lib/LGPL/iLOG3/LOGSCONF.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/src_lib_LGPL_iLOG3_LOGSCONF.c$(PreprocessSuffix) src/lib/LGPL/iLOG3/LOGSCONF.c

$(IntermediateDirectory)/src_lib_LGPL_iLOG3_test_test_config.c$(ObjectSuffix): src/lib/LGPL/iLOG3/test/test_config.c $(IntermediateDirectory)/src_lib_LGPL_iLOG3_test_test_config.c$(DependSuffix)
	$(CC) $(SourceSwitch) "/home/yaping/DevSpace/Datalink-HTTP-Server/Dev/src/lib/LGPL/iLOG3/test/test_config.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/src_lib_LGPL_iLOG3_test_test_config.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/src_lib_LGPL_iLOG3_test_test_config.c$(DependSuffix): src/lib/LGPL/iLOG3/test/test_config.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/src_lib_LGPL_iLOG3_test_test_config.c$(ObjectSuffix) -MF$(IntermediateDirectory)/src_lib_LGPL_iLOG3_test_test_config.c$(DependSuffix) -MM src/lib/LGPL/iLOG3/test/test_config.c

$(IntermediateDirectory)/src_lib_LGPL_iLOG3_test_test_config.c$(PreprocessSuffix): src/lib/LGPL/iLOG3/test/test_config.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/src_lib_LGPL_iLOG3_test_test_config.c$(PreprocessSuffix) src/lib/LGPL/iLOG3/test/test_config.c

$(IntermediateDirectory)/src_lib_LGPL_iLOG3_test_test_demo.c$(ObjectSuffix): src/lib/LGPL/iLOG3/test/test_demo.c $(IntermediateDirectory)/src_lib_LGPL_iLOG3_test_test_demo.c$(DependSuffix)
	$(CC) $(SourceSwitch) "/home/yaping/DevSpace/Datalink-HTTP-Server/Dev/src/lib/LGPL/iLOG3/test/test_demo.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/src_lib_LGPL_iLOG3_test_test_demo.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/src_lib_LGPL_iLOG3_test_test_demo.c$(DependSuffix): src/lib/LGPL/iLOG3/test/test_demo.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/src_lib_LGPL_iLOG3_test_test_demo.c$(ObjectSuffix) -MF$(IntermediateDirectory)/src_lib_LGPL_iLOG3_test_test_demo.c$(DependSuffix) -MM src/lib/LGPL/iLOG3/test/test_demo.c

$(IntermediateDirectory)/src_lib_LGPL_iLOG3_test_test_demo.c$(PreprocessSuffix): src/lib/LGPL/iLOG3/test/test_demo.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/src_lib_LGPL_iLOG3_test_test_demo.c$(PreprocessSuffix) src/lib/LGPL/iLOG3/test/test_demo.c


-include $(IntermediateDirectory)/*$(DependSuffix)
##
## Clean
##
clean:
	$(RM) -r ./Debug/


