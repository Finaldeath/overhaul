//::///////////////////////////////////////////////
//:: Custom User Defined Event
//:: q3_ud_dying
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    'Dying Woman' user defined events
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Oct 2003
//:://////////////////////////////////////////////

void main()
{
    int nUser = GetUserDefinedEventNumber();

    if(nUser == 1001) //HEARTBEAT
    {
        int nCurr = GetCurrentHitPoints();
        int nMax = GetMaxHitPoints();

        if((nCurr == nMax) && (GetLocalInt(OBJECT_SELF,"OS_SET_EFFECT") == 0))
        {
            //visual effect to mask creation of succubus and disappearance of woman
            event eFight = EventUserDefined(308);
            SignalEvent(OBJECT_SELF,eFight);
        }

        int nDieValue = GetLocalInt(OBJECT_SELF, "OS_ANIMATION");

        if(nDieValue == FALSE && !GetIsObjectValid(GetAttemptedAttackTarget())
            && !GetIsObjectValid(GetAttemptedSpellTarget()))
        {
            SetLocalInt(OBJECT_SELF, "OS_ANIMATION", TRUE);
            ClearAllActions();
            float fTime = HoursToSeconds(1);

            ActionPlayAnimation(ANIMATION_LOOPING_DEAD_BACK, 1.0, fTime);

            DelayCommand(fTime, SetLocalInt(OBJECT_SELF, "OS_ANIMATION", FALSE));
        }
    }
    else if(nUser == 1002) // PERCEIVE
    {

    }
    else if(nUser == 1003) // END OF COMBAT
    {

    }
    else if(nUser == 1004) // ON DIALOGUE
    {
        float fFacing  = GetFacing(OBJECT_SELF);
        SetFacing(fFacing);
        DelayCommand(0.1, SetFacing(fFacing));
        DelayCommand(0.5, SetFacing(fFacing));
        DelayCommand(1.0, SetFacing(fFacing));
    }
    else if(nUser == 1005) // ATTACKED
    {

    }
    else if(nUser == 1006) // DAMAGED
    {

    }
    else if(nUser == 1007) // DEATH
    {

    }
    else if(nUser == 1008) // DISTURBED
    {

    }
    else if(nUser == 308)
    {
        ClearAllActions(TRUE);
        SetLocalInt(OBJECT_SELF,"OS_SET_EFFECT",10);
        effect eVis = EffectVisualEffect(VFX_FNF_FIREBALL);
        location lVis = GetLocation(OBJECT_SELF);
        ApplyEffectAtLocation(DURATION_TYPE_INSTANT,eVis,lVis);
        object oMonster = CreateObject(OBJECT_TYPE_CREATURE,"q3_succubus",lVis);

        AssignCommand(GetModule(), DelayCommand(1.5f,
            AssignCommand(oMonster, ActionAttack(GetFirstPC()))));

        DelayCommand(0.1,DestroyObject(OBJECT_SELF));
    }

}

