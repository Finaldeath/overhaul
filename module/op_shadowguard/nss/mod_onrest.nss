#include "help_general"
#include "help_hench"

void main()
{
    object oPC = GetLastPCRested();

    // Destroy any Henchman Henchman
    // Destroy Henchman's Henchman if it exists
    object oHench = GetHenchman(oPC);
    object oHenchHench = GetHenchman(oHench);

    if (oHenchHench != OBJECT_INVALID)
        DestroyAssociate(oHenchHench, GetClassByPosition(1, oHenchHench));

    // add 8 hours of time to current time
    // NOTE: OnRest fires twice over course of entire rest
    int nHour = GetTimeHour();
    int nMinute = GetTimeMinute();
    int nSecond = GetTimeSecond();
    int nMilliSecond = GetTimeMillisecond();

    int nRestType = GetLastRestEventType();

    if (nRestType == REST_EVENTTYPE_REST_STARTED)
    {
        object o = GetFirstItemInInventory(oPC);

        string sCheck = "IT_MISC_MEAL";

        while (GetStringLeft(GetTag(o), GetStringLength(sCheck)) != sCheck && o != OBJECT_INVALID)
            o = GetNextItemInInventory(oPC);

        SetLocalObject(oPC, "O_CURR_MEAL", o);
    }

    else if (nRestType == REST_EVENTTYPE_REST_FINISHED)
    {
        // Reset Kara Summoning Ability
        SetLocalInt(GetModule(), "HENCH_KARA_N_DAILY_SHAD_SUMMON", 0);

        // Since Kara's Summoning handled via custom script, always decrement Death Domain Power
        if (GetTag(GetHenchman(oPC)) == "HENCH_KARA")
            DecrementRemainingFeatUses(GetHenchman(oPC), FEAT_DEATH_DOMAIN_POWER);

        object o = GetLocalObject(oPC, "O_CURR_MEAL");

        object oHunger = GetItemInSlot(INVENTORY_SLOT_CARMOUR, oPC);

        int nHungerState;

        if (oHunger == OBJECT_INVALID)
            nHungerState = 0;

        else
            nHungerState = StringToInt(GetStringRight(GetTag(oHunger), 1));

        // if PC doesn't have a Meal
        if (o == OBJECT_INVALID)
        {
            nHungerState++;

            // if it has been 10 days without food for PC, dies of starvation
            if (nHungerState >= 10)
            {
                FloatingTextStringOnCreature("STARVATION!", oPC);
                SendMessageToPC(oPC, "[From your prolonged state of food deprivation, you have died of starvation...]");
                ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDeath(), oPC);
            }

            else
            {
                DestroyObject(oHunger);
                oHunger = CreateItemOnObject("IT_CREA_HUNG_00" + IntToString(nHungerState), oPC);
                AssignCommand(oPC, ActionEquipItem(oHunger, INVENTORY_SLOT_CARMOUR));
                FloatingTextStringOnCreature("HUNGER WARNING!", oPC);
                SendMessageToPC(oPC, "[You have suffered a -" + IntToString(nHungerState) + " penalty to your Strength and Constitution from lack of food...]");
                SendMessageToPC(oPC, "[You can only go " + IntToString(10 - nHungerState) + " more days without food before dying of starvation...]");
            }
        }

        else
        {
            // Destroy the current meal
            DestroyObject(GetLocalObject(oPC, "O_CURR_MEAL"));

            // if PC has missed more than 3 days worth of meals, 3 days worth are deducted off of hunger damage
            if (nHungerState > 3)
            {
                // eating this current meal recovers from 3 days of hunger
                nHungerState -= 3;
                DestroyObject(oHunger);
                oHunger = CreateItemOnObject("IT_CREA_HUNG_00" + IntToString(nHungerState), oPC);
                AssignCommand(oPC, ActionEquipItem(oHunger, INVENTORY_SLOT_CARMOUR));
                FloatingTextStringOnCreature("HUNGER WARNING!", oPC);
                FloatingTextStringOnCreature("[You have recovered from 3 days worth of hunger.]", oPC);
                FloatingTextStringOnCreature("[You can only go " + IntToString(10 - nHungerState) + " more days without food before dying of starvation.]", oPC);
            }

            // otherwise, hunger will be less than 3, and fully recovered from any damage
            else if (oHunger != OBJECT_INVALID)
            {
                DestroyObject(oHunger);
                FloatingTextStringOnCreature("HUNGER WARNING!", oPC);
                FloatingTextStringOnCreature("[You have fully recovered from the effects of your hunger by eating this meal.]", oPC);
            }

            //Send a feedback message letting newbies know what's going on.
            else
            {
                //Parse through the inventory
                object oMeal = GetFirstItemInInventory(oPC);
                string sMeal;
                int iMeals = 0;
                while (oMeal != OBJECT_INVALID)
                {
                    //Check the tag prefix
                    sMeal = GetStringLeft(GetTag(oMeal), 12);
                    if (sMeal == "IT_MISC_MEAL")
                    {
                        //Increment the meal count
                        iMeals++;
                    }

                    //Update the loop variable
                    oMeal = GetNextItemInInventory(oPC);
                }

                //Subtract 1 to take into account the one just eaten.
                if (iMeals > 0)
                {
                    iMeals--;
                }

                //Send the message.
                string sMessage1 = "You stop to eat a meal from your pack.";
                string sMessage2 = IntToString(iMeals)+" meals remain.";
                FloatingTextStringOnCreature(sMessage1, oPC);
                FloatingTextStringOnCreature(sMessage2, oPC);
            }
        }

        //SetTime(nHour + 8, nMinute, nSecond, nMilliSecond);
    }
}
