//::///////////////////////////////////////////////
//:: Slave Freed
//:: act_hsl_freed
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The PC has set the slave free
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Oct 2003
//:://////////////////////////////////////////////

void main()
{
    effect eGhost = EffectCutsceneGhost();
    int iDoOnce = GetLocalInt(OBJECT_SELF, "act_hsl_freed");

    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eGhost, OBJECT_SELF, 30.0f);

    if (iDoOnce == FALSE)
    {
        SetLocalInt(OBJECT_SELF, "act_hsl_freed", TRUE);
        GiveXPToCreature(GetPCSpeaker(),500);
    }

    SetLocalInt(OBJECT_SELF,"OS_SLAVE_FREED",10);
}
