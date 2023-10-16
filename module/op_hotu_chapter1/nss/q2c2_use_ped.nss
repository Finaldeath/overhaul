//::///////////////////////////////////////////////
//:: Name: On Use q2c2 Pedastals
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    When you use one of the pedastals, if you have
    the corresponding coloured chain in your possession,
    you should be able to 'attach' it to the pedastal,
    so that it can be used to solve the puzzle.
*/
//:://////////////////////////////////////////////
//:: Created By:  Keith Warner
//:: Created On:  Nov 6/02
//:://////////////////////////////////////////////
#include "nw_i0_plot"

void GenerateColour(int nCount);
void UseChain(string szColour, object oPC);

void main()
{

    object oPC = GetLastUsedBy();
        //if the chain isn't on - start the chain attachment conversation
     if (GetLocalInt(OBJECT_SELF, "nChainOn") != 1)
     {
        AssignCommand(oPC, ClearAllActions(TRUE));
        ActionStartConversation(oPC);
     }
        //else next time you use the pedastal - it will use the chain above it.
     else
     {
        string szColour;
        if (GetTag(OBJECT_SELF) == "q2c2_ped_gre")
            szColour = "solgreen";
        else if (GetTag(OBJECT_SELF) == "q2c2_ped_yel")
            szColour = "solyellow";
        else if (GetTag(OBJECT_SELF) == "q2c2_ped_pur")
            szColour = "solpurple";
        else if (GetTag(OBJECT_SELF) == "q2c2_ped_red")
            szColour = "solred";
        UseChain(szColour, oPC);
     }
}



void UseChain(string szColour, object oPC)
{
    //Start the colour patterns appearing - if we are not between rounds (nWait !=1)

    //The lights should only be able to be clicked between rounds
    //When module variable nWait = 1

    //Then compare the light that was clicked with the current light we are
    //checking - if they match, continue to the next light to check or next
    //round - or if they don't match - Sven will inform the PC of his failure
    if (GetLocalInt(GetModule(),"nQ2C2Wait") == 1)
    {       //The Colour that was randomly generated                        Colour of light that was selected

        //Play sound so PC knows chain was pulled.
        AssignCommand(oPC, PlaySound("as_cv_shopmetal2"));


        if (GetLocalString(GetModule(),"szQ2C2Colour" + IntToString(GetLocalInt(GetModule(),"nQ2C2Selection"))) == szColour)
        {//if they match...

            //Add one to the selection variable
            SetLocalInt(GetModule(),"nQ2C2Selection",GetLocalInt(GetModule(),"nQ2C2Selection") + 1);
            //Check if round is over
            if (GetLocalInt(GetModule(),"nQ2C2Selection") >= 6)
            {
                //Turn off the wait variable so the chain is active
                SetLocalInt(GetModule(),"nQ2C2Wait",0);

                AssignCommand(oPC, PlaySound("as_cv_bell2"));

                //Unlock the door to the next area
                object oDoor = GetObjectByTag("q2c03_door");

                SetLocked(oDoor, FALSE);
                AssignCommand(oDoor, ActionOpenDoor(oDoor));
                AssignCommand(oDoor, PlaySound("as_cv_potclang3"));

                //Destroy the 4 chains in a flourish
                object oChain1 = GetObjectByTag("q2c2_chain", 0);
                object oChain2 = GetObjectByTag("q2c2_chain", 1);
                object oChain3 = GetObjectByTag("q2c2_chain", 2);
                object oChain4 = GetObjectByTag("q2c2_chain", 3);

                SetPlotFlag(oChain1, FALSE);
                SetPlotFlag(oChain2, FALSE);
                SetPlotFlag(oChain3, FALSE);
                SetPlotFlag(oChain4, FALSE);
                //effects
                effect eVfx1 = EffectVisualEffect(VFX_IMP_AC_BONUS);
                effect eVfx2 = EffectVisualEffect(VFX_IMP_MAGBLUE);
                effect eLink = EffectLinkEffects(eVfx1, eVfx2);

                location lChain1 = GetLocation(oChain1);
                location lChain2 = GetLocation(oChain2);
                location lChain3 = GetLocation(oChain3);
                location lChain4 = GetLocation(oChain4);

                //Chains 'Explode'
                ApplyEffectToObject(DURATION_TYPE_INSTANT, eLink,oChain1);
                ApplyEffectToObject(DURATION_TYPE_INSTANT, eLink,oChain2);
                ApplyEffectToObject(DURATION_TYPE_INSTANT, eLink,oChain3);
                ApplyEffectToObject(DURATION_TYPE_INSTANT, eLink,oChain4);

                DestroyObject(oChain1, 1.0);
                DestroyObject(oChain2, 1.0);
                DestroyObject(oChain3, 1.0);
                DestroyObject(oChain4, 1.0);

                //Finish variables
                SetLocalInt(GetLastUsedBy(),"nQ2C2Finished",1);
                SetLocalInt(GetModule(),"nQ2C2Finished",1);

                //Award XP(500)
                Reward_2daXP(oPC, XP_MEDIUM_LOW);
            }
            else
            {   // if it wasn't the final colour of a round - play the ship bell sound
                AssignCommand(GetLastUsedBy(),PlaySound("as_cv_bellship1"));
            }
        }
        else
        {   //if an incorrect colour was picked, play 'angry sound' and have trap activate

            AssignCommand(GetLastUsedBy(),PlaySound("as_na_steamshrt1"));
            //SetIsTemporaryEnemy(GetLastUsedBy(),GetObjectByTag("Sven"));
            //SetLocalInt(GetModule(),"nActivate",0);
            //SetLocalInt(GetModule(),"nRound",3);
            SetLocalInt(GetModule(),"nQ2C2Wait",0);
            location lTarget = GetLocation(GetWaypointByTag("wp_lev2_wellfailure"));
            effect eEffect = EffectLinkEffects(EffectVisualEffect(VFX_FNF_SUMMON_CELESTIAL), EffectVisualEffect(VFX_FNF_SCREEN_SHAKE));
            ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eEffect, lTarget);
            CreateObject(OBJECT_TYPE_CREATURE, "x0_wyrmling_red", lTarget );
        }
    }
    else
    {
        //Check to make sure all 4 chains have been attached
        //if (GetLocalInt(GetModule(), "nQ2C2ChainCount") != 4)
        //{
            FloatingTextStrRefOnCreature(101132, oPC);
        //}
        //else
        //{
            //if the colour sequence is playing
        //    FloatingTextStrRefOnCreature(85675, oPC);
        //}
    }
}

