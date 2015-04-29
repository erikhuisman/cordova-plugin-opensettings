//
//  Created by Erik Huisman
//

#import "OpenSettings.h"
#import <Cordova/CDV.h>

@implementation OpenSettings


-(void) settings:(CDVInvokedUrlCommand*)command {

    CDVPluginResult* pluginResult = nil;

    if (&UIApplicationOpenSettingsURLString != NULL) {// check if is iOS8 otherwise error
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    } else {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
    }

    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

-(void) bluetooth:(CDVInvokedUrlCommand*)command {

    CDVPluginResult* pluginResult = nil;

    [[CBCentralManager alloc] initWithDelegate:self queue:nil];

    // TODO check if is iOS8 otherwise error
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];

    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

-(void) bluetoothStatus:(CDVInvokedUrlCommand*)command {

  CDVPluginResult* pluginResult = nil;
  NSString *stateName = [self peripherialStateAsString:_peripheralManager.state];

  NSLog(@"Current bt status: %@", stateName);
  NSDictionary *dict = @{@"status": stateName};

  pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:dict];
  [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];

}

- (void)pluginInitialize {
    self.peripheralManager = [[CBPeripheralManager alloc] initWithDelegate:self queue:nil options:nil];
}

- (void) peripheralManagerDidUpdateState:(CBPeripheralManager *)peripheral { }

- (NSString*) peripherialStateAsString: (CBPeripheralManagerState) state {
    NSDictionary *dict = @{@(CBPeripheralManagerStatePoweredOff): @"PeripheralManagerStatePoweredOff",
                           @(CBPeripheralManagerStatePoweredOn): @"PeripheralManagerStatePoweredOn",
                           @(CBPeripheralManagerStateResetting): @"PeripheralManagerStateResetting",
                           @(CBPeripheralManagerStateUnauthorized): @"PeripheralManagerStateUnauthorized",
                           @(CBPeripheralManagerStateUnknown): @"PeripheralManagerStateUnknown",
                           @(CBPeripheralManagerStateUnsupported): @"PeripheralManagerStateUnsupported"};
    return [dict objectForKey:[NSNumber numberWithInteger:state]];
}

@end
