//::///////////////////////////////////////////////
//:: Name hx_denfire_ent
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     This will damage anyone that crosses here,
     unless they fly over. It does this by firing
     a custom UD.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Sept 15, 2003
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetEnteringObject();

    SetLocalObject(OBJECT_SELF, "HX_DENFIRE_ON", oPC);
    SignalEvent(OBJECT_SELF, EventUserDefined(4444));
}
