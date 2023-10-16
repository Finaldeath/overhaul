//Remove the player's hood once the Slave Pen Guards are dead.

void RemoveHood(object oPC)
{
    //Parse through the effects on the player
    effect eEffect = GetFirstEffect(oPC);
    int iType;
    while (GetIsEffectValid(eEffect) == TRUE)
    {
        //Remove the Blindness effect
        iType = GetEffectType(eEffect);
        if (iType == EFFECT_TYPE_BLINDNESS ||
            iType == EFFECT_TYPE_VISUALEFFECT)
        {
            RemoveEffect(oPC, eEffect);
        }

        //Update the loop variables
        eEffect = GetNextEffect(oPC);
    }

    SetCommandable(TRUE, oPC);
}

void main()
{
    //Optimize to run only when player is in area.
    object oPC = GetFirstPC();
    object oArea = GetArea(oPC);
    if (oArea == OBJECT_SELF)
    {
        //If the nearest guard is dead, look for the second nearest.
        object oGuard = GetNearestObjectByTag("BH_SLAVE_GUARD", oPC);
        if (GetIsDead(oGuard) == TRUE)
        {
            oGuard = GetNearestObjectByTag("BH_SLAVE_GUARD", oPC, 2);
        }
        //If both are either dead or invalid
        if (oGuard == OBJECT_INVALID ||
            GetIsDead(oGuard) == TRUE)
        {
            //Nest within a DoOnce
            int bDead = GetLocalInt(GetModule(), "bBH_GUARDS_DEAD");
            if (bDead == FALSE)
            {
                //Flag the DoOnce
                SetLocalInt(GetModule(), "bBH_GUARDS_DEAD", TRUE);

                AssignCommand(oPC, ClearAllActions(TRUE));
                SetCommandable(FALSE, oPC);

                //Have Lyen run to the player and do a SpeakString.
                object oLyen = GetNearestObjectByTag("HENCH_LYEN", oPC);
                AssignCommand(oLyen, ClearAllActions(TRUE));
                AssignCommand(oLyen, JumpToObject(oPC));
                AssignCommand(oLyen, ActionSpeakString("Here, let me get that hood off you."));
                DelayCommand(1.0, RemoveHood(oPC));
            }
        }
    }
}
