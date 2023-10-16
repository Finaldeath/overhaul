//::///////////////////////////////////////////////
//:: Spider Encounter (OnEnter)
//:: En_Enc_Spiders.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Cast Web on the entering player
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: March 24, 2003
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetEnteringObject();
    int bDoOnce = GetLocalInt(OBJECT_SELF, "bDoOnce");

    if (GetIsPC(oPC) == TRUE &&
        GetMaster(oPC) == OBJECT_INVALID &&
        bDoOnce == FALSE)
    {
       object oWebCaster = GetNearestObjectByTag("WebCaster");
       AssignCommand(oWebCaster, ActionCastSpellAtObject(SPELL_WEB, oPC, METAMAGIC_ANY, TRUE, 0, PROJECTILE_PATH_TYPE_HIGH_BALLISTIC, TRUE));
       SetLocalInt(OBJECT_SELF, "bDoOnce", TRUE);
    }
}
