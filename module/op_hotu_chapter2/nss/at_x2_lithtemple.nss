//at_x2_lithtemple
void main()
{
    object oClicker = GetClickingObject();

    //Can't leave if haven't talked to the Seer

    if (GetLocalInt(GetModule(), "Seer_Progression") != 4)
        FloatingTextStrRefOnCreature(85674, oClicker);  //"This is not a good time to leave this area!"
    else
    {
        //DoOnce - set variable
        if (GetLocalInt(oClicker, "X2_Chpt2FirstLeaveTemple") == 0)
        {
            SetLocalInt(oClicker, "X2_L_ENSERRIC_ASKED_Q3", 1);
            SetLocalInt(oClicker, "X2_Chpt2FirstLeaveTemple", 1);
        }

        //Set the henchmen to non-plot (Which they are right at the start of the module)

        int nCount = 1;
        object oHench = GetHenchman(oClicker, nCount);
        while (GetIsObjectValid(oHench) == TRUE)
        {
            SetPlotFlag(oHench, FALSE);
            nCount++;
            oHench = GetHenchman(oClicker, nCount);
        }
        object oTarget = GetTransitionTarget(OBJECT_SELF);

        SetAreaTransitionBMP(AREA_TRANSITION_RANDOM);

        AssignCommand(oClicker,JumpToObject(oTarget));
    }
}
