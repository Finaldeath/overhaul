//::///////////////////////////////////////////////
//:: Name q2a_enter_envrns
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Do a plot check for the possibility of running
    the intermediate cutscenes
*/
//:://////////////////////////////////////////////
//:: Created By:  Keith Warner
//:: Created On:  Oct 9/03
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetEnteringObject();
    if (GetIsDM(oPC) == TRUE)
        return;
    if (GetIsPC(oPC) == FALSE)
        return;

    ExploreAreaForPlayer(OBJECT_SELF, oPC);
    //if the PC has spoken to the seer about the siege - nothing else needs happen here
    //this variable is set in the Seer's conversation when she sends the PC off to the siege
    if (GetLocalInt(GetModule(), "X2_StartSeerSiegeSpeech") == 2)
        return;

        //Ok - we need to do a plot check whenever the PC enters the zone - in case they
        //come back from the boat trip having done another plot.  After the 1st and 3rd
        //plots are done - we run a cutscene (q7_cut702  and then q7_cut703)
        int nCount = 0;
        //First - check to see if any new plots have been completed
        //Shattered Mirror
        if (GetLocalInt(GetModule(), "q6_city_gone") == 1)
        {
            if (GetLocalInt(GetModule(), "X2_nShatteredMirrorCounted") != 1)
            {
                SetLocalInt(GetModule(), "X2_nShatteredMirrorCounted", 1);
                nCount = nCount + 1;

            }
        }
        //Hive Mother
        if (GetLocalInt(GetModule(), "x2_plot_beholders_out") == 1)
        {
            if (GetLocalInt(GetModule(), "X2_nHiveMotherCounted") != 1)
            {
                SetLocalInt(GetModule(), "X2_nHiveMotherCounted", 1);
                nCount = nCount + 1;

            }
        }
        //Isle of the Maker
        if (GetLocalInt(GetModule(), "x2_plot_golem1_in") == 1 ||
            GetLocalInt(GetModule(), "x2_plot_golem2_in") == 1 ||
            GetLocalInt(GetModule(), "x2_plot_psource") == 1)
        {
            if (GetLocalInt(GetModule(), "X2_nMakerCounted") != 1)
            {
                SetLocalInt(GetModule(), "X2_nMakerCounted", 1);
                nCount = nCount + 1;

            }
        }
        //Slaves to the Overmind
        if (GetLocalInt(GetModule(), "X2_Q2DOvermind") > 0)
        {
            if (GetLocalInt(GetModule(), "X2_nOvermindCounted") != 1)
            {
                SetLocalInt(GetModule(), "X2_nOvermindCounted", 1);
                nCount = nCount + 1;

            }
        }

        //Dracolich
        if (GetLocalInt(GetModule(), "x2_plot_undead_out") == 1)
        {
            if (GetLocalInt(GetModule(), "X2_nDracolichCounted") != 1)
            {
                SetLocalInt(GetModule(), "X2_nDracolichCounted", 1);
                nCount = nCount + 1;

            }
        }
        //Number of Plots done equals previously counted plots + Plots completed in this count
        int nPlotProgress = GetLocalInt(GetModule(), "X2_Chapter2Plots_Done") + nCount;
        SetLocalInt(GetModule(), "X2_Chapter2Plots_Done", nPlotProgress);


        //Run the following cutscenes (The > 4 plot - go to siege is handled by trigger near the gates)
        if (nPlotProgress >= 3 && GetLocalInt(GetModule(), "X2_Cut703Done") != 1)
        {
            SetLocalInt(GetModule(), "X2_Cut703Done", 1);
            ExecuteScript("q7_cut703", oPC);
            return;
        }
        else if (nPlotProgress >= 1 && GetLocalInt(GetModule(), "X2_Cut702Done") != 1)
        {
            SetLocalInt(GetModule(), "X2_Cut702Done", 1);
            ExecuteScript("q7_cut702", oPC);
            return;
        }
}
