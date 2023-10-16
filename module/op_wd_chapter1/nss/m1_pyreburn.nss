#include "NW_I0_Plot"
void main()
{
    int nReward = 25;
    object oArea = GetArea(OBJECT_SELF);
    object oPC = GetLastUsedBy();
    string sTorchTag = "NW_IT_TORCH001";
    if(GetLocalInt(oPC,"NW_L_M1_Pyres") == FALSE)
    {
        SetLocalInt(oPC,"NW_L_M1_Pyres",TRUE);
        SpeakOneLinerConversation("M1_PyreInfoTrig");
    }
    else if( GetLocalInt(OBJECT_SELF,"NW_L_OnFire") == FALSE &&
        (GetTag(GetItemInSlot(INVENTORY_SLOT_LEFTHAND,oPC)) == sTorchTag ||
         GetTag(GetItemInSlot(INVENTORY_SLOT_RIGHTHAND,oPC)) == sTorchTag  ) )
    {
        SetLocalInt(OBJECT_SELF,"NW_L_OnFire",TRUE);
        SetLocalObject(oArea,"NW_G_PyreToFlame",OBJECT_SELF);
        AssignCommand(oPC,ClearAllActions());
        AssignCommand(oPC,ActionMoveToObject(OBJECT_SELF,FALSE,0.5));
        AssignCommand(oPC,ActionPlayAnimation(ANIMATION_LOOPING_GET_LOW));
        AssignCommand(oPC,ActionDoCommand(SignalEvent(oArea,EventUserDefined(10))));
        GiveXPToCreature(oPC,nReward);

        SetLocalInt(GetModule(), "pen_burn_bodies", GetLocalInt(GetModule(), "pen_burn_bodies") + 1);

    }
    else
    {
        SpeakOneLinerConversation("M1_PyreInfoTrig");
    }
}
