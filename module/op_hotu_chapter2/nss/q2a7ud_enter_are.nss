//q2a7ud_enter_are
#include "x2_inc_restsys"
void main()
{
    object oPC = GetEnteringObject();
    if(!GetIsPC(oPC))
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


    if (GetLocalInt(OBJECT_SELF, "nDoOnce") == 1)
        return;

    SetLocalInt(OBJECT_SELF, "nDoOnce", 1);
    WMSetAreaTable(OBJECT_SELF, "q2a7_underdark", FALSE);

    int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_SETUP_ONCE");
    if(nDoOnce == 1)
        return;

    SetLocalInt(OBJECT_SELF, "DO_SETUP_ONCE", 1);

    object oFocus = GetObjectByTag("bk_loc9");
    object oControl = GetNearestObjectByTag("X2_PLC_MFDCONT1", oFocus);
    effect eVis1 = EffectVisualEffect(VFX_DUR_LIGHT_BLUE_5);
    effect eVis2 = EffectVisualEffect(VFX_DUR_GLOW_BLUE);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVis1, oControl);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVis2, oControl);
}

