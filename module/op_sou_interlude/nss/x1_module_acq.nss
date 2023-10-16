
#include "x1_inc_plot"
#include "nw_i0_plot"


void main()
{
    object oItem = GetModuleItemAcquired();
    string sTag = GetTag(oItem);
    object oPC = GetModuleItemAcquiredBy();

    if(sTag == "q2_rod_blight")
    {
        if(!GetIsPlayerCharacter(oPC))
            return;
        int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_ROD_PLOT_ONCE");
        if(nDoOnce == 1)
            return;
        SetLocalInt(OBJECT_SELF, "DO_ROD_PLOT_ONCE", 1);
        SetPlot("Q2_JOURNAL_ROD", 10, oPC); // player finds the rod without knowing what it is
    }
    else if(sTag == "q3_formcrystal")
    {
        // Seal entrance to Formian hive
        object oWP1 = GetObjectByTag("Q3B_WP_BOULDER_SP");
        CreateObject(OBJECT_TYPE_PLACEABLE, "x0_desertboulde2", GetLocation(oWP1));
        int n = 1;
        object oWP = GetNearestObjectByTag("Q3B_WP_BOULDER_SP", oWP1, n);
        while(oWP != OBJECT_INVALID)
        {
            CreateObject(OBJECT_TYPE_PLACEABLE, "x0_desertboulde2", GetLocation(oWP));
            n++;
            oWP = GetNearestObjectByTag("Q3B_WP_BOULDER_SP", oWP1, n);
        }
        object oAT1 = GetObjectByTag("Q2BAT_Ruins_FormianLair");
        object oAT2 = GetObjectByTag("Q3BAT_Ruins2_FormianLair2");
        DestroyObject(oAT1);
        DestroyObject(oAT2);
    }

    if (GetPlotFlag(oItem) == TRUE)
    {
        object oPC = GetModuleItemAcquiredBy();

        //HENCHMEN SPECIAL ITEMS
        //else if the item is Dorna's battle axe
        if (GetTag(oItem) == "x0_dor_battleaxe")
        {
            //Do a Henchman check
            if (GetTag(oPC) != "x0_hen_dor")
            {
                DestroyObject(oItem, 0.2);
                object oDorna = GetObjectByTag("x0_hen_dor");
                if (GetIsObjectValid(oDorna) == TRUE)
                    CreateItemOnObject("dor_battleaxe", oDorna);
            }

        }
        //else if the item is Xanos's bracer
        else if (GetTag(oItem) == "x0_xan_bracer")
        {
            //Do a Henchman check
            if (GetTag(oPC) != "x0_hen_xan")
            {
                DestroyObject(oItem, 0.2);
                object oXanos = GetObjectByTag("x0_hen_xan");
                if (GetIsObjectValid(oXanos) == TRUE)
                    CreateItemOnObject("xan_bracer", oXanos);
            }

        }
        object oMaster;
        //if the henchman acquired a plot item - give it to its master..
        if (GetMaster(oPC) != OBJECT_INVALID)
        {
            oMaster = GetMaster(oPC);
            //CopyObject(oItem, GetLocation(OBJECT_SELF), oMaster);
            //DestroyObject(oItem);
        }
        //if it was the PC that acquired the item
        if (GetIsPC(oPC) == TRUE || oMaster != OBJECT_INVALID)
        {
            string szItemTag = GetTag(oItem);
            //If the Item is the Hawthorn berries for Drogan's cure


            if (szItemTag == "q1bcards")
            {
                //Do a Henchman check
                if (oMaster != OBJECT_INVALID)
                    oPC = oMaster;
                if (GetLocalInt(oPC, "NW_JOURNAL_ENTRYq1bhalfling") == 15)
                {
                    //Add journal entry
                    AddJournalQuestEntry("q1bhalfling", 17, oPC);
                }
                else if ((GetLocalInt(oPC, "NW_JOURNAL_ENTRYq1bhalfling") == 10) ||
                        (GetLocalInt(oPC, "NW_JOURNAL_ENTRYq1bhalfling") == 16))
                {
                    AddJournalQuestEntry("q1bhalfling", 18, oPC);
                }
            }
        }
     }
}
