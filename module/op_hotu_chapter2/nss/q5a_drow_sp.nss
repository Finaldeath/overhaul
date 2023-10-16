//::///////////////////////////////////////////////
//:: Name x2_def_spawn
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Default On Spawn script


    2003-07-28: Georg Zoeller:

    If you set a ninteger on the creature named
    "X2_USERDEFINED_ONSPAWN_EVENTS"
    The creature will fire a pre and a post-spawn
    event on itself, depending on the value of that
    variable
    1 - Fire Userdefined Event 1510 (pre spawn)
    2 - Fire Userdefined Event 1511 (post spawn)
    3 - Fire both events

*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: June 11/03
//:://////////////////////////////////////////////

const int EVENT_USER_DEFINED_PRESPAWN = 1510;
const int EVENT_USER_DEFINED_POSTSPAWN = 1511;

void main()
{
    // User defined OnSpawn event requested?
    int nSpecEvent = GetLocalInt(OBJECT_SELF,"X2_USERDEFINED_ONSPAWN_EVENTS");
    effect eInv = EffectVisualEffect(VFX_DUR_CUTSCENE_INVISIBILITY);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, eInv, OBJECT_SELF);
    effect eUltra = EffectUltravision();
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, eUltra, OBJECT_SELF);
    // Pre Spawn Event requested
    if (nSpecEvent == 1  || nSpecEvent == 3  )
    {
    SignalEvent(OBJECT_SELF,EventUserDefined(EVENT_USER_DEFINED_PRESPAWN ));
    }

    ExecuteScript("nw_c2_default9", OBJECT_SELF);

    //Post Spawn event requeste
    if (nSpecEvent == 2 || nSpecEvent == 3)
    {
    SignalEvent(OBJECT_SELF,EventUserDefined(EVENT_USER_DEFINED_POSTSPAWN));
    }
    if(GetTag(OBJECT_SELF) == "q5a_eldath")
        SetLocalString(OBJECT_SELF,"X2_SPECIAL_COMBAT_AI_SCRIPT", "q5_ai_eldath");

}
