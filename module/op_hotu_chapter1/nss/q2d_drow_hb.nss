//::///////////////////////////////////////////////
//:: Name x2_def_heartbeat
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Default Heartbeat script
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: June 11/03
//:://////////////////////////////////////////////

void IncreaseSkills()
{
    int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_INC_ONCE");
    if(nDoOnce == 1)
        return;
    SetLocalInt(OBJECT_SELF, "DO_INC_ONCE", 1);

    effect eInc1 = EffectSkillIncrease(SKILL_LISTEN, 15);
    effect eInc2 = EffectSkillIncrease(SKILL_SPOT, 15);

    ApplyEffectToObject(DURATION_TYPE_PERMANENT, eInc1, OBJECT_SELF);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, eInc2, OBJECT_SELF);

}

void main()
{
    if(GetLocalInt(GetArea(OBJECT_SELF), "PREPARE") == 1)
    {
        // increase listen and spot
        IncreaseSkills();
        ActionRandomWalk();
    }
    ExecuteScript("nw_c2_default1", OBJECT_SELF);
}
