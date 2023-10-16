/// Checks if PC has already hired Vanya or checks if plot already complete

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetModule(), "NW_G_M4Q01TRANCAR_HENCH") ==0 &&
               (GetLocalInt(GetModule(), "NW_G_M4Q01_CATAPULTS") < 2 || GetLocalInt(GetModule(), "NW_G_M4Q01_GOLEMS") < 2);

    return iResult;
}
