//::///////////////////////////////////////////////
//:: x0_inc_cuts.nss
//:: Copyright (c) 2002 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Include file to handle the cutscene
    functionality.


    THIS PARTICULAR implementation is intended for use with the Matron's
    execution cutscenes.

    cutsceneOn and cutSceneOff however are used for other, more generic cutscenes
    like the history book.
*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////

// * FUNCTION DECLARATION

// * generic cutscene functions

void cutSceneOn();
void cutSceneOff();
int cutSceneIsOn();
void cutSceneSetAbortScript(string sScript, float fDelay);
void cutSceneRunAbortScript(object oPC);
void cutSceneSetDelay();
int cutSceneDelay();

// * Execution specific cutscene stuff

string cutsceneGetNextVictimTag(string sCut, int bIncrementVictim = FALSE);
object cutSceneGetVictim(string sCut);
void cutSceneSetVictim(string sCut, object oVictim);



// * FUNCTION IMPLEMENTATION
//::///////////////////////////////////////////////
//:: cutSceneOn
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Sets the module global that says a cutscene
    was happening.
*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////

void cutSceneOn()
{
    SetLocalInt(GetModule(), "NW_L_CUTSCENESON", 10);
}
void cutSceneOff()
{
    //sCut is the name of the cutscene
    //fDelay this is when the next execution could happen
    //SpeakString(FloatToString(GetLocalFloat(GetModule(), "NW_L_CUTSCENEDELAY")));
    AssignCommand(GetModule(), DelayCommand(GetLocalFloat(GetModule(), "NW_L_CUTSCENEDELAY"), (SetLocalInt(GetModule(), "NW_L_CUTSCENE_EXECUTIONDELAY", 0))));
    SetLocalInt(GetModule(), "NW_L_CUTSCENESON", 0);
}

int cutSceneIsOn()
{
    if (GetLocalInt(GetModule(), "NW_L_CUTSCENESON") == 10)
    {
        return TRUE;
    }
    return FALSE;

}
// * returns TRUE if the delay has elapsed
int cutSceneDelay()
{
    if (GetLocalInt(GetModule(), "NW_L_CUTSCENE_EXECUTIONDELAY") == 0)
    {
        return TRUE;
    }
    return FALSE;
}
void cutSceneSetDelay()
{
    SetLocalInt(GetModule(), "NW_L_CUTSCENE_EXECUTIONDELAY", 10);
}

//::///////////////////////////////////////////////
//:: cutSceneSetAbortScript
//:: Copyright (c) 2002 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This is the script that will fire in a load
    save game situation if the cutscene was interrupted
    fDelay: This is the time between segments of the cutscenes
*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////
void cutSceneSetAbortScript(string sScript, float fDelay)
{
    SetLocalString(GetModule(), "NW_L_CUTSCENEABORTSCRIPT", sScript);
    SetLocalFloat(GetModule(), "NW_L_CUTSCENEDELAY", fDelay);
}

void cutSceneRunAbortScript(object oPC)
{
    ExecuteScript(GetLocalString(GetModule(), "NW_L_CUTSCENEABORTSCRIPT"), oPC);
}

//::///////////////////////////////////////////////
//:: GetNextVictimTag
//:: Copyright (c) 2002 Bioware Corp.
//:://////////////////////////////////////////////
/*
    bIncrementVictim: Actually sets the victim as
    'Dead' only do this once per iteration (right as it
    is being killed)
*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////
// * Execution specific cutscene stuff

string cutsceneGetNextVictimTag(string sCut, int bIncrementVictim = FALSE)
{
    int nNumberOfVictims = GetLocalInt(GetModule(),"NW_L_"+sCut + "NUMBER");
    int nCurrentVictim = 1; // * iterate through all victims till all are used up
    // * stores the resref of this potential victim
    string sVictim = "";
    string sTrueVictim = "FAILED";

    // * victim not dead yet, they be used
    do
    {
        if (GetLocalInt(GetModule(), "NW_L_"+sCut+"VICTIMDEAD"+IntToString(nCurrentVictim)) == 1)
        {
            //* mark this victim as used -- i.e., dead
            if (bIncrementVictim == TRUE)
                SetLocalInt(GetModule(), "NW_L_"+sCut+"VICTIMDEAD"+IntToString(nCurrentVictim),10);

            sVictim = GetLocalString(GetModule(), "NW_L_"+sCut+"VICTIM"+IntToString(nCurrentVictim));

            sTrueVictim = sVictim;
        }
        nCurrentVictim++;
    }
    while ((sTrueVictim == "FAILED") && (nCurrentVictim <= nNumberOfVictims));
    return sTrueVictim;
}
//::///////////////////////////////////////////////
//:: cutSceneSetPossibleVictim
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Adds this
    VictimDead 1 = initialized
    VictimDead 10 = Dead
*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////
void cutSceneSetPossibleVictim(string sScript, string sVictim)
{
    int nNumberOfVictims = GetLocalInt(GetModule(),"NW_L_"+sScript + "NUMBER");
    nNumberOfVictims++;
    // * stores the resref of this potential victim
    SetLocalString(GetModule(), "NW_L_"+sScript+"VICTIM"+IntToString(nNumberOfVictims),sVictim);
    // * stores the fact that this victim is still able to be used
    SetLocalInt(GetModule(), "NW_L_"+sScript+"VICTIMDEAD"+IntToString(nNumberOfVictims),1);
    SetLocalInt(GetModule(),"NW_L_"+sScript + "NUMBER", nNumberOfVictims);

}


//::///////////////////////////////////////////////
//:: cutSceneSetVictim
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Sets oVictim as the current victim object
*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////

void cutSceneSetVictim(string sCut, object oVictim)
{
    SetLocalObject(GetModule(), "NW_L_CUTSCENEVICTIMOBJ" + sCut, oVictim);
}
object cutSceneGetVictim(string sCut)
{
    return GetLocalObject(GetModule(), "NW_L_CUTSCENEVICTIMOBJ" + sCut);
}



