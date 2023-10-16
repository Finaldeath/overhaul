//::///////////////////////////////////////////////
//:: XP2 Divining Pool
//:: H1_Us_DivPool
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This scripts starts the lost item store and
    fires the XP2-specific conversation.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: November 05, 2003
//:://////////////////////////////////////////////

void main()
{
   // OpenStore(GetObjectByTag("LostItems"), GetLastUsedBy());
   SetLocalInt(OBJECT_SELF, "NW_L_IAMLOSTSTORE", 10);
   ActionStartConversation(GetLastUsedBy(), "");
}
