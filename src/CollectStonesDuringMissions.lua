-- Collect Stones During Missions
-- Copyright Heavy Metal Gaming (aka Dylan Myers) <gamer.hm.2021@gmail.com>
-- Based somewhat on, and inspired by, the Collect Straw At Missions mod by derSchreiner

CollectStonesDuringMissions = {};

function CollectStonesDuringMissions:loadMap(name)
    MissionManager.getIsMissionWorkAllowed = Utils.overwrittenFunction(MissionManager.getIsMissionWorkAllowed, CollectStonesDuringMissions.getIsMissionWorkAllowed);
end; 

function CollectStonesDuringMissions:getIsMissionWorkAllowed(superFunc, farmId, x, z, workAreaType)
    return superFunc(self, farmId, x, z, workAreaType) or ((workAreaType == WorkAreaType.STONEPICKER)
    	and (superFunc(self, farmId, x, z, WorkAreaType.CULTIVATOR) or superFunc(self, farmId, x, z, WorkAreaType.PLOW)
    	or superFunc(self, farmId, x, z, WorkAreaType.SOWINGMACHINE)));
end

addModEventListener(CollectStonesDuringMissions);