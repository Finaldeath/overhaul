//::///////////////////////////////////////////////
//:: Witch's Wake 1: Gong (Raven Variant)
//:: WW1_Gong_Raven
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Ringing the gong in the Dawn / Battlefied
     area scares away the crows / ravens for a
     brief period of time.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: April 27, 2004
//:://////////////////////////////////////////////

void FlyAway(string sCrow, object oPC)
{
    int iNth = 1;
    object oCrow = GetNearestObjectByTag(sCrow, OBJECT_SELF, iNth);
    if (oCrow != OBJECT_INVALID)
    {
        //Apply crow audio to the gong to make it easier to hear.
        AssignCommand(oPC, PlaySound("as_an_birdflap2"));
        AssignCommand(oPC, PlaySound("as_an_crow1"));
    }
    while (oCrow != OBJECT_INVALID)
    {
        //Ignore dead crows
        if (GetIsDead(oCrow) == FALSE)
        {
            //Determine the return location.
            location lCrow = GetLocation(oCrow);
            effect eFlyAway = EffectDisappearAppear(lCrow);
            //Determine length of disappearance.
            int iRandom = Random(60)+60;
            float fRandom = IntToFloat(iRandom);
            //Perform the Fly Away animation
            AssignCommand(oCrow, ClearAllActions(TRUE));
            DelayCommand(0.2, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eFlyAway, oCrow, fRandom));
        }
        //Update loop variables
        iNth++;
        oCrow = GetNearestObjectByTag(sCrow, OBJECT_SELF, iNth);
    }
}

void main()
{
    object oPC = GetLastUsedBy();
    string sString = "The gong's call echoes across the frozen "+
                     "battlefield, startling the gathered crows to flight.";

    //Have the Player whisper the message to themselves.
    object oVoice = GetNearestObjectByTag("ww1_narrator194", oPC);
    SoundObjectPlay(oVoice);
    DelayCommand(25.0, SoundObjectStop(oVoice));
    AssignCommand(oPC, SpeakString(sString, TALKVOLUME_WHISPER));

    //Gong ring.
    PlaySound("as_cv_gongring2");

    //Scare away the various crow types
    FlyAway("DawnCrow1", oPC);
    FlyAway("DawnCrow2", oPC);
    FlyAway("DawnCrowA", oPC);
    FlyAway("DawnCrowB", oPC);
}
