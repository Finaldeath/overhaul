//::///////////////////////////////////////////////
//:: FileName test_store
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 5/6/2003 7:53:41 PM
//:://////////////////////////////////////////////
#include "nw_i0_plot"

void main()
{

	// Either open the store with that tag or let the user know that no store exists.
	object oStore = GetNearestObjectByTag("test_store");
	if(GetObjectType(oStore) == OBJECT_TYPE_STORE)
		gplotAppraiseOpenStore(oStore, GetPCSpeaker());
	else
		ActionSpeakStringByStrRef(53090, TALKVOLUME_TALK);
}
