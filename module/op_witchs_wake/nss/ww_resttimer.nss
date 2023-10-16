//::///////////////////////////////////////////////
//:: Witch Wake: Rest Timer
//:: WW_RestTimer.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Handle the timer aspect of WW's time-limited,
     partial HP recovery resting system. This runs
     as a repeating ExecuteScript on the player.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: November 23, 2004
//:://////////////////////////////////////////////

void main()
{
    object oPC = OBJECT_SELF;
    float fNextRest = GetLocalFloat(oPC, "fNextRest");
    int iPreviousRestDifficulty = GetLocalInt(oPC, "iPreviousRestDifficulty");
    int iCurrentRestDifficulty = GetGameDifficulty()-1;
    float fPreviousRestDifficulty = IntToFloat(iPreviousRestDifficulty);
    float fCurrentRestDifficulty = IntToFloat(iCurrentRestDifficulty);

    //Update the Previous Rest Difficulty with the Current one.
    SetLocalInt(oPC, "iPreviousRestDifficulty", iCurrentRestDifficulty);

    //Recalculate the timer if there's been a change in Difficulty Setting.
    if (iPreviousRestDifficulty != iCurrentRestDifficulty)
    {
        //Avoid 'Divide by Zero' errors.
        if (iPreviousRestDifficulty != 0)
        {
            fNextRest = fNextRest / fPreviousRestDifficulty * fCurrentRestDifficulty;
        }
        else
        {
            fNextRest = 0.0;
        }

    }

    //Subtract the current minute.
    fNextRest = fNextRest - 60.0;
    SetLocalFloat(oPC, "fNextRest", fNextRest);

    //If the timer has not expired, re-execute the script in 60 seconds.
    if (fNextRest > 59.0)
    {
        DelayCommand(60.0, ExecuteScript("ww_resttimer", oPC));
    }
}
