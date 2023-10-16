//::///////////////////////////////////////////////
//:: Animal COmpanion Spawn In Script
//::
//:: NW_CH_AC9.nss
//::
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
//:: Sets the animal companion up to be able to
//:: listen to given commands.
//:://////////////////////////////////////////////
//::
//:: Created By:  Brent, September 24 2001
//:: Modified by:
//:://////////////////////////////////////////////

void main()
{

    SetAssociateListenPatterns();
    // * Companions, come in, by default with Attack Nearest Enemy && Follow Master modes
    SetLocalInt(OBJECT_SELF,"NW_COM_MODE_COMBAT",ASSOCIATE_COMMAND_ATTACKNEAREST);
    SetLocalInt(OBJECT_SELF,"NW_COM_MODE_MOVEMENT",ASSOCIATE_COMMAND_FOLLOWMASTER);
    // * default to middle-range
    SetLocalFloat(OBJECT_SELF,"NW_MINION_DISTANCE", 7.0);
    if (GetLocalInt(OBJECT_SELF,"NW_L_TortureDamage") == 0)
    {
        SetLocalInt(OBJECT_SELF,"NW_L_TortureDamage",10);
        ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectDamage(GetCurrentHitPoints() - 5),OBJECT_SELF);
        ActionPlayAnimation(ANIMATION_LOOPING_SIT_CROSS,1.0,500.0);
    }
}
