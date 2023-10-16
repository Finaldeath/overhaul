///// Check if PC has done Aribeth's initial dialog

int StartingConditional()
{
    int bCondition = GetLocalInt(GetPCSpeaker(),"NW_L_M1Q1FSpokeToArib") == FALSE ;
                     //Aribeth not spoken to
    return bCondition;
}
