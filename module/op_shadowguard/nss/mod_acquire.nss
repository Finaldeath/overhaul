#include "help_hench"
#include "help_general"

void main()
{
    object oOld = GetModuleItemAcquiredFrom();
    object oItem = GetModuleItemAcquired();
    object o = GetItemPossessor(oItem);

    //Ensure that the acquirer is a PC and not in the opening area (i.e. they
    //acquired the item in a previous playthrough)
    if (GetIsPC(o) == TRUE &&
        GetArea(o) != OBJECT_INVALID &&
        GetTag(GetArea(o)) != "AREA_VOID_ETER_CRYPT")
    {
        // Special Case for when item is "non-takeable"
        if (GetStringLeft(GetTag(oOld), 5) == "HENCH" && GetPlotFlag(oItem))
        {
            CopyItem(oItem, oOld);

            SetPlotFlag(oItem, FALSE);
            DestroyObject(oItem);

            SceneSpeak(oOld, "I'm sorry, " + GetName(o) + ", but I cannot allow you to take that item...");
        }

        // Special case for Stage 0 Lyen Quest when picking up Bloodhawk armor
        if (GetStringLeft(GetName(oItem), 9) == "Bloodhawk" && GetBaseItemType(oItem) == BASE_ITEM_ARMOR && GetLocalInt(GetModule(), "N_MODULE_STAGE") == 0)
        {
            object oHench = GetHenchman(o);

            if (GetTag(oHench) == "HENCH_LYEN")
                SceneSpeak(oHench, "It might be wise to keep that Bloodhawk outfit handy, " + GetName(o) + ".  We might be able to use it to sneak into the Bloodhawk base undetected...");
        }

        else if (GetTag(oItem) == "IT_PLOT_003")
            AddJournalSingle("JT_PREL_TARI", 4, o);

        else if (GetTag(oItem) == "IT_PLOT_008")
            AddJournalSingle("JT_JANTHOS", 2, o);

        else if (GetTag(oItem) == "IT_PLOT_004")
            SetLocalInt(o, "N_GOT_IRIL_CRYS", 1);

        else if (GetTag(oItem) == "IT_PLOT_017")
            AddJournalSingle("JT_PREL_MARK", 5, o);

        else if (GetTag(oItem) == "IT_PLOT_007")
            SetLocalInt(o, "N_KNOW_CTST_WORDS", 1);


        // SWORD OF TRUTH
        else if (GetTag(oItem) == "IT_PLOT_025")
        {
            if (GetLocalInt(GetModule(), "N_DO_" + GetTag(oItem)) == 0)
            {
                string s = "HENCH_KARA";

                object oHench = GetNearestObjectByTag(s, o);

                object oWP = GetNearestObjectByTag("WP_HR_" + s + "_0_0", o);

                location lWP = GetLocation(oWP);

                SceneSpeak(oHench, "Good work...  Come, let us return to Markius...");

                AssignCommand(oHench, ActionMoveToLocation(lWP, TRUE));

                AssignCommand(oHench, DelayCommand(6.0, JumpToLocation(lWP)));

                SetLocalInt(GetModule(), "N_DO_" + GetTag(oItem), 1);
            }
        }

        // SHIELD OF VALOR
        else if (GetTag(oItem) == "IT_PLOT_026")
        {
            if (GetLocalInt(GetModule(), "N_DO_" + GetTag(oItem)) == 0)
            {
                string s = "HENCH_LYEN";

                object oHench = GetNearestObjectByTag(s, o);

                object oWP = GetNearestObjectByTag("WP_HR_" + s + "_0_0", o);

                location lWP = GetLocation(oWP);

                SceneSpeak(oHench, "So we have recovered the shield...  Excellent work, my young friend!  Let us return to Markius and make our way into the Sepulcher...");

                AssignCommand(oHench, ActionMoveToLocation(lWP, TRUE));

                AssignCommand(oHench, DelayCommand(6.0, JumpToLocation(lWP)));

                SetLocalInt(GetModule(), "N_DO_" + GetTag(oItem), 1);
            }
        }

        // RIDDLER'S KEY
        else if (GetTag(oItem) == "IT_PLOT_027")
        {
            SetLocalInt(o, "N_GOT_KEY_RIDDLER", 1);
        }

        // KING KHAGRIM'S KEY
        else if (GetTag(oItem) == "IT_PLOT_028")
        {
            SetLocalInt(o, "N_GOT_KEY_KHAGRIM", 1);
        }

        // FLAME OF FAITH
        else if (GetTag(oItem) == "IT_PLOT_036")
        {
            int i = GetLocalInt(o, "N_FLAMES_OF_FAITH_ACQUIRED");

            i++;

            SetLocalInt(o, "N_FLAMES_OF_FAITH_ACQUIRED", i);

            // MAKE SURE THIS IS THE FIRST TIME THIS ITEM WAS ACQUIRED
            if (GetLocalInt(oItem, "N_ACQUIRED") == 0)
            {
                // IF ONLY GOTTEN 1
                if (i == 1)
                {
                    AddJournalSingle("JT_GRAD_CEREMONY", 3, o);
                }

                // OTHERWISE, GOT 2
                else if (i == 2)
                {
                    AddJournalSingle("JT_GRAD_CEREMONY", 4, o);
                }

                // MARK THE PRIEST IT WAS ACQUIRED FROM AS HAVING GIVEN FLAME
                SetLocalInt(oOld, "N_GAVE_FLAME", 1);
            }

            // MARK THIS ITEM AS HAVING BEEN GOTTEN
            SetLocalInt(oItem, "N_ACQUIRED", 1);

        }

        // BLOODSTONE FOR KARA'S PRELUDE QUEST
        else if (GetTag(oItem) == "IT_PLOT_037")
            SetLocalInt(o, "N_TOOK_BLOODSTONE", 1);

        // MALGOR'S CORPSE FOR KARA'S STAGE 0 QUEST
        else if (GetTag(oItem) == "IT_PLOT_038")
            AddJournalSingle("JT_PREL_KARA", 8, o);

        // HOLY IDOL PIECES
        else if (GetTag(oItem) == "IT_PLOT_HOLY_IDOL_PIECE")
        {
            if (GetLocalInt(oItem, "N_DO_ONCE") == 0)
            {
                int i = GetLocalInt(o, "N_HOLY_IDOL_PIECES_RECOVERED");

                i++;

                SetLocalInt(o, "N_HOLY_IDOL_PIECES_RECOVERED", i);

                if (i == 3)
                {
                    TestMessage("[The Holy Idol should have been created in inventory, and pieces removed...]");
                }

                string sCurrTrial = GetLocalString(o, "S_COR_CURR_TRIAL");

                SetLocalInt(o, "N_" + sCurrTrial, 1);

                AddJournalSingle("JT_ST_2_MAIN", i + 4, o);

                SetLocalInt(oItem, "N_DO_ONCE", 1);
            }
        }

        // SAKARA's KEY
        else if (GetTag(oItem) == "IT_PLOT_046")
        {
            SetLocalInt(o, "N_GOT_SAKARA_KEY", 1);
        }

        // BLOODHAWK MISSIVE FROM RAVENCLAW TAVERN
        else if (GetTag(oItem) == "IT_PLOT_047")
        {
            AddJournalSingle("JT_PREL_LYEN", 10, o);
        }

        // Check to see if this was a theft from placeable
        if (GetStringRight(GetLocalString(oItem, "S_BELONGED_TO"), 2) == "_I")
        {
            AdjustAlignment(o, ALIGNMENT_CHAOTIC, 2);
            DeleteLocalString(oItem, "S_BELONGED_TO");
        }
    }

    else if (GetSubString(GetTag(o), 0, 5) == "HENCH" && o != GetLocalObject(GetModule(), "O_MASTER_" + GetTag(o)))
    {
        if (GetIsPC(oOld))
        {
            if (GetPlotFlag(oItem))
            {
                CopyItem(oItem, oOld);

                SetPlotFlag(oItem, FALSE);
                DestroyObject(oItem);

                SendMessageToPC(oOld, "[You cannot give Plot Items to your Henchman...]");
            }

            else
                CreateItemOnObject(GetTag(oItem), GetRefHench(o), GetNumStackedItems(oItem));
        }
    }
}
