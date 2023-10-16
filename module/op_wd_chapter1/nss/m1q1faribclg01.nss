///// Check if PC has done Aribeth's initial dialog

int StartingConditional()
{
    int bCondition = GetLocalInt(GetModule(),"NW_G_M1Q1MainPlot") == 0 &&
                     //plot not started
                     GetLocalInt(GetPCSpeaker(),"NW_L_M1Q1FSpokeToArib") == TRUE ;
                     //Aribeth not spoken to
    return bCondition;
}
