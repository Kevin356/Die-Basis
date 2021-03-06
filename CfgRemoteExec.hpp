#define F(NAME,TARGET) class NAME { \
    allowedTargets = TARGET; \
};

#define ANYONE 0
#define CLIENT 1
#define SERVER 2

class CfgRemoteExec {
	class Functions {
		mode = 1;
		jip = 0;
		
		/**************/
		/*** CLIENT ***/
		/**************/
		
		F(life_fnc_adminid,CLIENT)
		F(life_fnc_admininfo,CLIENT)
		F(life_fnc_addVehicle2Chain,CLIENT)
		F(life_fnc_bountyReceive,CLIENT)
		F(life_fnc_breathalyzer,CLIENT)
		F(life_fnc_broadcast,CLIENT)
		F(life_fnc_CAH_reciever,CLIENT)
		F(life_fnc_copLights,CLIENT)
		F(life_fnc_copMedicRequest,CLIENT)
		F(life_fnc_copSearch,CLIENT)
		F(life_fnc_copSiren,CLIENT)
		F(life_fnc_copSiren2,CLIENT)
		F(life_fnc_corpse,CLIENT)
		F(life_fnc_demoChargeTimer,CLIENT)
		F(life_fnc_economyUpdatePriceArray,CLIENT)
		F(life_fnc_flashbang,CLIENT)
		F(life_fnc_gangCreated,CLIENT)
		F(life_fnc_gangDisbanded,CLIENT)
		F(life_fnc_gangInvite,CLIENT)
		F(life_fnc_giveDiff,CLIENT)
		F(life_fnc_hasOrgan,CLIENT)
		F(life_fnc_impoundMenu,CLIENT)
		F(life_fnc_jail,CLIENT)
		F(life_fnc_jailMe,CLIENT)
		F(life_fnc_jumpFnc,CLIENT)
		F(life_fnc_knockedOut,CLIENT)
		F(life_fnc_licenseCheck,CLIENT)
		F(life_fnc_licensesRead,CLIENT)
		F(life_fnc_lightHouse,CLIENT)
		F(life_fnc_Lizenzsehen,CLIENT)
		F(life_fnc_LockCarSound,CLIENT)
		F(life_fnc_medicLights,CLIENT)
		F(life_fnc_medicRequest,CLIENT)
		F(life_fnc_medicSiren,CLIENT)
		F(life_fnc_moveIn,CLIENT)
		F(life_fnc_netSetVar,CLIENT)
		F(life_fnc_pb_response,CLIENT)
		F(life_fnc_playSound,CLIENT)
		F(life_fnc_pulloutVeh,CLIENT)
		F(life_fnc_pushFunction,CLIENT)
		F(life_fnc_receiveItem,CLIENT)
		F(life_fnc_receiveMoney,CLIENT)
		F(life_fnc_removeLicense,CLIENT)
		F(life_fnc_removeLicenses,CLIENT)
		F(life_fnc_removeWeapons,CLIENT)
		F(life_fnc_restrain,CLIENT)
		F(life_fnc_revived,CLIENT)
		F(life_fnc_robPerson,CLIENT)
		F(life_fnc_robReceive,CLIENT)
		F(life_fnc_ryn_message,CLIENT)
		F(life_fnc_say3D,CLIENT)
		F(life_fnc_searchClient,CLIENT)
		F(life_fnc_smartphone,CLIENT)
		F(life_fnc_soundDevice,CLIENT)
		F(life_fnc_tazeSound,CLIENT)
		F(life_fnc_ticketPaid,CLIENT)
		F(life_fnc_ticketPrompt,CLIENT)
		F(life_fnc_UnLockCarSound,CLIENT)
		F(life_fnc_vehicleAnimate,CLIENT)
		F(life_fnc_vehicleEmpd,CLIENT)
		F(life_fnc_vehicleWarned,CLIENT)
		F(life_fnc_wantedList,CLIENT)
		F(life_fnc_weedSmoke,CLIENT)
		
		F(SOCK_fnc_dataQuery,CLIENT)
		F(SOCK_fnc_insertPlayerInfo,CLIENT)
		F(SOCK_fnc_requestReceived,CLIENT)
		
		F(SPY_fnc_cookieJar,CLIENT)
		F(SPY_fnc_notifyAdmins,CLIENT)
		
		F(TON_fnc_clientGangKick,CLIENT)
		F(TON_fnc_clientGangLeader,CLIENT)
		F(TON_fnc_clientGetKey,CLIENT)
		F(TON_fnc_clientMessage,CLIENT)
		F(TON_fnc_clientWireTransfer,CLIENT)
		
		/**************/
		/*** SERVER ***/
		/**************/
		
		F(bis_fnc_execVM,SERVER)
		
		F(DB_fnc_insertRequest,SERVER)
		F(DB_fnc_queryRequest,SERVER)
		F(DB_fnc_updatePartial,SERVER)
		F(DB_fnc_updateRequest,SERVER)
		
		F(life_fnc_jailSys,SERVER)
		F(life_fnc_wantedAdd,SERVER)
		F(life_fnc_wantedBounty,SERVER)
		F(life_fnc_wantedFetch,SERVER)
		F(life_fnc_wantedPardon,SERVER)
		F(life_fnc_wantedRemove,SERVER)
		
		F(TON_fnc_addHouse,SERVER)
		F(TON_fnc_chopShopSell,SERVER)
		F(TON_fnc_cleanupMessages,SERVER)
		F(TON_fnc_cleanupRequest,SERVER)
		F(TON_fnc_economySendArrayToClient,SERVER)
		F(TON_fnc_getID,SERVER)
		F(TON_fnc_getVehicles,SERVER)
		F(TON_fnc_handleCheckDate,SERVER)
		F(TON_fnc_handleMessages,SERVER)
		F(TON_fnc_insertGang,SERVER)
		F(TON_fnc_keyManagement,SERVER)
		F(TON_fnc_managesc,SERVER)
		F(TON_fnc_msgRequest,SERVER)
		F(TON_fnc_paintball,SERVER)
		F(TON_fnc_player_query,SERVER)
		F(TON_fnc_removeGang,SERVER)
		F(TON_fnc_SAH_addOffer,SERVER)
		F(TON_fnc_SAH_reciever,SERVER)
		F(TON_fnc_SAH_Transaction,SERVER)
		F(TON_fnc_sellHouse,SERVER)
		F(TON_fnc_setObjVar,SERVER)
		F(TON_fnc_spawnVehicle,SERVER)
		F(TON_fnc_spikeStrip,SERVER)
		F(TON_fnc_updateGang,SERVER)
		F(TON_fnc_updateHouseContainers,SERVER)
		F(TON_fnc_updateHouseTrunk,SERVER)
		F(TON_fnc_vehicleCreate,SERVER)
		F(TON_fnc_vehicleDelete,SERVER)
		F(TON_fnc_vehicleRepaint,SERVER)
		F(TON_fnc_vehicleStore,SERVER)
		
		/**************/
		/*** ANYONE ***/
		/**************/
		
		F(life_fnc_lockVehicle,ANYONE)
		F(life_fnc_setFuel,ANYONE)
		F(life_fnc_simDisable,ANYONE)
	};
	
	class Commands {
		mode=0;
		jip=0;
	};
};