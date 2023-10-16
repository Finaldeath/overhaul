//::///////////////////////////////////////////////
//:: Liftoff Trigger (OnEnter)
//:: En_Trig_Liftoff.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Infrom the player of the city's liftoff.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: May 12, 2003
//:://////////////////////////////////////////////
#include "x0_i0_common"

void main()
{
    object oPC = GetEnteringObject();
    int bInactive = GetLocalInt(OBJECT_SELF, "bInactive");
    int iDelay;
    float fDelay;
    int iMaxIterations;
    int iCurrentIteration;
    int iMaxRubble;
    int iCurrentRubble;
    location lPC = GetLocation(oPC);
    vector vPC = GetPositionFromLocation(lPC);
    int iOffset_X;
    int iOffset_Y;
    float fOffset_X;
    float fOffset_Y;
    vector vOffset;
    location lOffset;
    effect eDebris = EffectVisualEffect(353);
    effect eShake = EffectVisualEffect(356);
    int iSoundDelay;
    float fSoundDelay;
    int iSoundType;
    string sSoundResRef = "Null ResRef";
    object oNearestPC;
    int iNearestPC;

    //Only worry about entering PCs and active triggers
    if (GetIsPC(oPC) == TRUE && bInactive == FALSE)
    {
        //Determine the delay preceding the tremor
        fDelay = 0.0;
/*DEBUG*///DelayCommand(fDelay, SendMessageToPC(oPC, "fDelay = "+FloatToString(fDelay)));

        //Determine the length of the tremor (# of iterations)
        iMaxIterations = Random(3)+3;
        iCurrentIteration = 0;
/*DEBUG*///DelayCommand(fDelay, SendMessageToPC(oPC, "iMaxIterations = "+IntToString(iMaxIterations)));
        while (iCurrentIteration < iMaxIterations)
        {
/*DEBUG*///DelayCommand(fDelay, SendMessageToPC(oPC, "iCurrentIteration = "+IntToString(iCurrentIteration)));
            //Determine the number of rubble points on this iteration.
            iMaxRubble = Random(6);
            iCurrentRubble = 0;
/*DEBUG*///DelayCommand(fDelay, SendMessageToPC(oPC, "iMaxRubble = "+IntToString(iMaxRubble)));
            while (iCurrentRubble < iMaxRubble)
            {
/*DEBUG*///DelayCommand(fDelay, SendMessageToPC(oPC, "iCurrentRubble = "+IntToString(iCurrentRubble)));
                //Determine the offset values for this rubble point.
                iOffset_X = Random(30)-15;
                iOffset_Y = Random(30)-15;
                fOffset_X = IntToFloat(iOffset_X);
                fOffset_Y = IntToFloat(iOffset_Y);
                vOffset = Vector(vPC.x + fOffset_X, vPC.y + fOffset_Y, vPC.z + 15.0);
                lOffset = Location(GetArea(OBJECT_SELF), vOffset, 0.0);

                //Apply the Debris effect to the rubble point.
                DelayCommand(fDelay, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eDebris, lOffset));

                //Update loop variables
                iCurrentRubble++;
            }

            //Determine which sound to play on this iteration.
            iSoundType = Random(35)+1;
            switch (iSoundType)
            {
                case 1: //Beam Creak 1
                    sSoundResRef = "as_cv_beamcreak1";
                    break;
                case 2: //Beam Creak 2
                    sSoundResRef = "as_cv_beamcreak2";
                    break;
                case 3: //Beam Creak 3
                    sSoundResRef = "as_cv_beamcreak3";
                    break;
                case 4: //Beam Creak 4
                    sSoundResRef = "as_cv_beamcreak4";
                    break;
                case 5: //Building Crumble 1
                    sSoundResRef = "as_cv_bldgcrumb1";
                    break;
                case 6: //Building Crumble 2
                    sSoundResRef = "as_cv_bldgcrumb2";
                    break;
                case 7: //Building Crumble 3
                    sSoundResRef = "as_cv_bldgcrumb3";
                    break;
                case 8: //Boiler Groan 1
                    sSoundResRef = "as_cv_boilergrn1";
                    break;
                case 9: //Boiler Groan 2
                    sSoundResRef = "as_cv_boilergrn2";
                    break;
                case 10: //Distant Boom 1
                    sSoundResRef = "as_cv_boomdist1";
                    break;
                case 11: //Distant Boom 2
                    sSoundResRef = "as_cv_boomdist2";
                    break;
                case 12: //Crank
                    sSoundResRef = "as_cv_crank1";
                    break;
                case 13: //Pipe Groan 1
                    sSoundResRef = "as_cv_pipegroan1";
                    break;
                case 14: //Pipe Groan 2
                    sSoundResRef = "as_cv_pipegroan2";
                    break;
                case 15: //Pipe Groan 3
                    sSoundResRef = "as_cv_pipegroan3";
                    break;
                case 16: //Pipe Groan 4
                    sSoundResRef = "as_cv_pipegroan4";
                    break;
                case 17: //Ship Hull 1
                    sSoundResRef = "as_cv_shiphull1";
                    break;
                case 18: //Ship Hull 2
                    sSoundResRef = "as_cv_shiphull2";
                    break;
                case 19: //Large Cave Rockfall
                    sSoundResRef = "as_cv_rockcavlg1";
                    break;
                case 20: //Small Cave Rockfall 1
                    sSoundResRef = "as_cv_rockcavsm1";
                    break;
                case 21: //Small Cave Rockfall 2
                    sSoundResRef = "as_cv_rockcavsm2";
                    break;
                case 22: //Large Rockfall 1a
                    sSoundResRef = "as_cv_rockfalgl1";
                    break;
                case 23: //Large Rockfall 2a
                    sSoundResRef = "as_cv_rockfalgl2";
                    break;
                case 24: //Large Rockfall 1b
                    sSoundResRef = "as_cv_rockfallg1";
                    break;
                case 25: //Large Rockfall 2b
                    sSoundResRef = "as_cv_rockfallg2";
                    break;
                case 26: //Small Rockfall 1
                    sSoundResRef = "as_cv_rockfalsm1";
                    break;
                case 27: //Small Rockfall 2
                    sSoundResRef = "as_cv_rockfalsm2";
                    break;
                case 28: //Small Rockfall 3
                    sSoundResRef = "as_cv_rockfalsm3";
                    break;
                case 29: //Small Rockfall 4
                    sSoundResRef = "as_cv_rockfalsm4";
                    break;
                //Any additional cases = no SFX.
            }

            //Play the sound.
            AssignCommand(oPC, DelayCommand(fDelay, PlaySound(sSoundResRef)));
/*DEBUG*///DelayCommand(fDelay, SendMessageToPC(oPC, "SFX = "+sSoundResRef));

            //Play the screen shake for all players in the area
            iNearestPC = 1;
            oNearestPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC, OBJECT_SELF, iNearestPC);
            while (oNearestPC != OBJECT_INVALID)
            {
                DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_INSTANT, eShake, oNearestPC));

                //Update loop variables
                iNearestPC++;
                oNearestPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC, OBJECT_SELF, iNearestPC);
            }

            //Increment the delay for the next iteration.
            fDelay = fDelay + 2.0;

            //Update loop variables.
            iCurrentIteration++;
        }

        //Give the player a floaty text message indicating that the city is
        //finally lifting off.
        FloatingTextStrRefOnCreature(76394, oPC, TRUE);
        FloatingTextStrRefOnCreature(76460, oPC, TRUE);

        //Deactivate the trigger for a while to prevent over-firing.
        SetLocalInt(OBJECT_SELF, "bInactive", TRUE);
        DelayCommand(60.0, SetLocalInt(OBJECT_SELF, "bInactive", FALSE));
    }
}
