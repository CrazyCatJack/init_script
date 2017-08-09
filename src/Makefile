TARGET			=	perftest
INCLUDES		+=	-I$(STAGING_DIR)/usr/include/allwinner/include -I$(STAGING_DIR)/usr/include/allwinner
LIBS			+=  -lpthread -ldl -lrt \

SRCS	= perftest.c

$(TARGET): $(SRCS)
	$(CC) -o $(TARGET) $(INCLUDES) $(LIBS) $(LDFLAGS) $(CFLAGS) -mfpu=vfp $(SRCS) 

install:$(TARGET)
	@mkdir -p $(CONFIG_PREFIX)/usr/bin
	@cp  $(TARGET) $(CONFIG_PREFIX)/usr/bin

all:install


clean:
	rm -rf $(TARGET) *.o *.a *~
	cd common && rm -f *.o *.a *.bak *~ .depend
