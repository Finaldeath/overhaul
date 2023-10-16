#include "help_hench"
#include "help_general"

void ElectricalGrenadeExplosion(location l)
{
    object oInvisible = CreateObject(OBJECT_TYPE_PLACEABLE, "PLAC_INVISIBLE", l);

    SetLocalInt(oInvisible, "N_THREW_BY_PC", 1);

    int nDamage;
    int nMiss;

    int i = 1;

    object o;

    o = GetNearestObjectToLocation(OBJECT_TYPE_ALL, l, i);

    while (GetDistanceBetweenLocations(l, GetLocation(o)) < 12.0)
    {
        nMiss = FALSE;

        nDamage = d10(2);

        if (ReflexSave(o, 12) == 1)
            nMiss = TRUE;

        else
            ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDamage(nDamage, DAMAGE_TYPE_ELECTRICAL), o);

        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectBeam(VFX_BEAM_LIGHTNING, oInvisible, BODY_NODE_CHEST, nMiss), o, 3.0);

        i++;

        o = GetNearestObjectToLocation(OBJECT_TYPE_ALL, l, i);
    }

    DestroyObject(oInvisible, 4.0);
}

void MakeTheJump(object oWP, object oPC,object oHench = OBJECT_INVALID,object oFam = OBJECT_INVALID,object oAnim = OBJECT_INVALID,object oSumm = OBJECT_INVALID)
{
   AssignCommand(oPC, JumpToObject(oWP));
   if (GetIsObjectValid(oHench))
       AssignCommand(oHench, JumpToObject(oPC));
   if (GetIsObjectValid(oFam))
       AssignCommand(oFam, JumpToObject(oPC));
   if (GetIsObjectValid(oAnim))
       AssignCommand(oAnim, JumpToObject(oPC));
   if (GetIsObjectValid(oSumm))
       AssignCommand(oSumm, JumpToObject(oPC));
}

void ApplyEffectsToParty(object oPC,object oHench = OBJECT_INVALID,object oFam = OBJECT_INVALID,object oAnim = OBJECT_INVALID,object oSumm = OBJECT_INVALID)
{
   //Define the cutscene effects
   effect eInvis = EffectVisualEffect(VFX_DUR_CUTSCENE_INVISIBILITY);
   effect eGhost = EffectCutsceneGhost();
   effect eCalm = EffectEthereal();
   effect eCombo = EffectLinkEffects(eInvis,eGhost);
   eCombo = EffectLinkEffects(eCombo,eCalm);

   //Apply the effects to the PC
   ApplyEffectToObject(DURATION_TYPE_PERMANENT, eCombo, oPC);

   //Apply the effects to all associates.
   if (GetIsObjectValid(oHench))
   {
       ApplyEffectToObject(DURATION_TYPE_PERMANENT, eCombo, oHench);
   }

   if (GetIsObjectValid(oFam))
   {
       ApplyEffectToObject(DURATION_TYPE_PERMANENT, eCombo, oFam);
   }
   if (GetIsObjectValid(oAnim))
   {
       ApplyEffectToObject(DURATION_TYPE_PERMANENT, eCombo, oAnim);
   }

   if (GetIsObjectValid(oSumm))
   {
       ApplyEffectToObject(DURATION_TYPE_PERMANENT, eCombo, oSumm);
   }
}


void main()
{
    object oItem = GetItemActivated();
    object oPC = GetItemActivator();

    if (GetIsPC(oPC))
    {
        // --------------  BEGIN TESTER ITEMS ------------- //

        if (GetTag(oItem) == "IT_PLOT_999")
            CreateObject(OBJECT_TYPE_CREATURE, "thetester", GetLocation(oPC));

        // Tester Watch Item
        else if (GetTag(oItem) == "IT_PLOT_1000")
        {
            int nDay = GetCalendarDay();
            int nMonth = GetCalendarMonth();
            int nYear = GetCalendarYear();
            int nHour = GetTimeHour();
            int nMinute = GetTimeMinute();
            int nSecond = GetTimeSecond();
            int nMillisecond = GetTimeMillisecond();

            string s = "[It is " + IntToString(nHour) + " : " + IntToString(nMinute) + " : " + IntToString(nSecond) + " : " + IntToString(nMillisecond) + " on Day " + IntToString(nDay) + " of month " + IntToString(nMonth) + " of the year " + IntToString(nYear) + "]";

            SendMessageToPC(oPC, s);
        }

        // Crimson Prophet Spawn Item
        else if (GetTag(oItem) == "IT_SU_CR_PR")
        {
            string sTag = "CT_UNIQ_NT_CRIM";

            CreateObject(OBJECT_TYPE_CREATURE, sTag, GetItemActivatedTargetLocation());
        }

        // Henchman summoning items
        else if (GetStringLeft(GetTag(oItem), 6) == "IT_SU_")
        {
            string sTag = GetStringRight(GetTag(oItem), 10);

            CreateHenchman(oPC, sTag, GetItemActivatedTargetLocation());
        }

        // ------------  END TESTER ITEMS ------------------- //

        // -------------------------------------------------- //

        // ------------  GENERAL PURPOSE ITEMS ------------- //

        // Rope
        else if (GetTag(oItem) == "IT_MISC_THN_001")
        {
            object oTarget = GetLocalObject(oPC, "O_CURR_ROPE_OBJECT");

            // if a boulder that has been spotted as being accessible and no rope currently attached
            if (GetTag(oTarget) == "PLAC_PC_RPRK_U" && GetLocalObject(oTarget, "O_ROPE") == OBJECT_INVALID)
            {
                AssignCommand(oPC, ClearAllActions());

                AssignCommand(oPC, ActionStartConversation(oPC, "plac_rprk_lower", TRUE, FALSE));
            }

            // else, invalid rope target chosen, send message and end
            else
                SceneSpeak(oPC, "[You cannot fathom a reason for needing a rope at the moment...  You slowly replace the rope into your pack.]");
        }

        // Electrical Charge Grenade
        else if (GetTag(oItem) == "IT_MISC_MED_002")
        {
            location l = GetItemActivatedTargetLocation();

            DestroyObject(oItem);

            SceneSpeak(oPC, "[You lob the grenade towards its target location...  It might be wise to move out of its path before it detonates...]");

            int nDisTrapSkill = GetSkillRank(SKILL_DISABLE_TRAP, oPC);

            float fSetTime = 2.0 + (IntToFloat(nDisTrapSkill) * 0.35);

            DelayCommand(fSetTime, ElectricalGrenadeExplosion(l));

        }

        // ------------  END GENERAL PURPOSE ITEMS ---------- //

        // -------------------------------------------------- //

        // ------------- BEGIN SPECIAL PURPOSE ITEMS -------- //

        // Enchanted Irilium Crystals
        else if (GetTag(oItem) == "IT_PLOT_020")
        {
            if (GetTag(GetItemActivatedTarget()) == "CT_COMM_GC_CONS")
            {
                int n = GetLocalInt(oItem, "N_NUMB_USES");


                n++;

                SetLocalInt(oItem, "N_NUMB_USES", n);

                if (n < 3)
                {
                    object oConst = GetItemActivatedTarget();

                    ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectResurrection(), GetItemActivatedTarget());
                    ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectHeal(GetMaxHitPoints(GetItemActivatedTarget())), GetItemActivatedTarget());

                    ChangeToStandardFaction(oConst, STANDARD_FACTION_MERCHANT);
                }

                else
                {
                    SendMessageToPC(oPC, "[You have used the last of the Irilium Crystals in your possession...]");

                    DestroyObject(oItem);
                }
            }
        }

        else if (GetTag(oItem) == "IT_PLOT_034")
        {
            CreateObject(OBJECT_TYPE_CREATURE, "ct_uniq_th_gina", GetItemActivatedTargetLocation());

            DestroyObject(oItem);

            SceneSpeak(oPC, "[You gently set Gina Thakaros down before you...]");
        }

        //Chronicles of Abaran (cutscene tome)
        else if (GetTag(oItem) == "SG_CHRONICLES")
        {
            //Don't allow them to use it in combat.
            int bCombat = GetIsInCombat(oPC);
            if (bCombat == TRUE)
            {
                //Error Message
                string sMsg = "You are too busy to read this right now...";
                FloatingTextStringOnCreature(sMsg, oPC);
            }
            else
            {

                object oHench = GetAssociate(ASSOCIATE_TYPE_HENCHMAN, oPC);
                object oFam = GetAssociate(ASSOCIATE_TYPE_FAMILIAR, oPC);
                object oAnim = GetAssociate(ASSOCIATE_TYPE_ANIMALCOMPANION, oPC);
                object oSumm = GetAssociate(ASSOCIATE_TYPE_SUMMONED, oPC);

                //Put them into cutscene mode
                SetCutsceneMode(oPC, TRUE);

                //Save out their current location for future reference
                location lPC = GetLocation(oPC);
                SetLocalLocation(GetModule(), "lPC_PreChronicles", lPC);

                //Fade to Black
                FadeToBlack(oPC);
                DelayCommand(2.0,ApplyEffectsToParty(oPC,oHench,oAnim,oSumm));

                //Jump everyone to the "Chronicles of Abaran" area
                object oWP = GetWaypointByTag("WP_CHRONICLES_START");
                DelayCommand(2.25,MakeTheJump(oWP,oPC,oHench,oFam,oAnim,oSumm));

                //Set the conversation variable
                SetLocalInt(oPC, "ChroniclesChapter", 0);

                //Have the player launch the conversation with themself.
                DelayCommand(4.0, AssignCommand(oPC, ActionStartConversation(oPC, "sc_st_0_open_1", FALSE, FALSE)));
            }
        }
    }
}
