all: airsensor

airsensor:
	gcc airsensor.c -lusb -o airsensor
	
clean:
	rm airsensor