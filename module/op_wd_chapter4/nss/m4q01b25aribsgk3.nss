//////  Aribeth in Prison

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetModule(), "NW_G_M4Q01PLOT_ARIBETH_SURRENDER") ==1;
    return iResult;
}
