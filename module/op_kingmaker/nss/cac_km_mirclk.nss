//::///////////////////////////////////////////////
//:: Rotate the mirror Clockwise
//:: cac_km_mirclk
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This script runs on a nearby bracket and rotates
    the projectile emitting mirror clockwise in the
    bastion of the enemy level.
*/
//:://////////////////////////////////////////////
//:: Created By: Keith K2 Hayward
//:: Created On: June 2004
//:://////////////////////////////////////////////

void main()
{
    object oNewMirror;
    object oSelf = OBJECT_SELF;
    object oMirror = GetObjectByTag("large_mirror_a");

    location lSpawn;
    int iFacing = GetLocalInt(oSelf, "MIRROR_FACING");
    string sCURRENTDEST;
    effect eVFXSparks = EffectVisualEffect(VFX_COM_SPARKS_PARRY);

    ActionPauseConversation();

    if ((iFacing - 45) >= 0)
    {
        iFacing -= 45;
    }
    else
    {
        iFacing = (iFacing + 360) - 45;
    }

    // find the new proper orientation
    switch ((iFacing/45) + 1)
    {
        case 1 :
            sCURRENTDEST = GetLocalString(oSelf, "DESTINATION5");
        break;

        case 2 :
            sCURRENTDEST = GetLocalString(oSelf, "DESTINATION4");
        break;

        case 3 :
            sCURRENTDEST = GetLocalString(oSelf, "DESTINATION3");
        break;

        case 4 :
            sCURRENTDEST = GetLocalString(oSelf, "DESTINATION2");
        break;

        case 5 :
            sCURRENTDEST = GetLocalString(oSelf, "DESTINATION1");
        break;

        case 6 :
            sCURRENTDEST = GetLocalString(oSelf, "DESTINATION8");
        break;

        case 7 :
            sCURRENTDEST = GetLocalString(oSelf, "DESTINATION7");
        break;

        case 8 :
            sCURRENTDEST = GetLocalString(oSelf, "DESTINATION6");
        break;
    }

//    AssignCommand(oSelf, SetFacing(IntToFloat(iFacing)));
    lSpawn = Location(GetArea(oMirror), GetPosition(oMirror), IntToFloat(iFacing));
    oNewMirror = CreateObject(OBJECT_TYPE_PLACEABLE, "km_mainmirror", lSpawn);

    ApplyEffectToObject(DURATION_TYPE_INSTANT, eVFXSparks, oNewMirror);
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eVFXSparks, oMirror);
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eVFXSparks, oSelf);

    DelayCommand(0.5, DestroyObject(oMirror));

    //AssignCommand(oNewMirror, SetFacing(IntToFloat(iFacing)));
    SetLocalInt(oSelf, "MIRROR_FACING", iFacing);
    SetLocalString(oSelf, "CURRENTDEST", sCURRENTDEST);
    SetCustomToken(9999, IntToString(iFacing));

    DelayCommand(1.0f, ActionResumeConversation());
}
