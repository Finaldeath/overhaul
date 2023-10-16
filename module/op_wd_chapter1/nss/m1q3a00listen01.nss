#include "NW_I0_Plot"
int StartingConditional()
{
    int roll=d100();
    if (roll>66)
    {
        object oFormosa = GetObjectByTag("Formosa");
        if (GetLocalInt(GetModule(),"NW_G_M1Q3AFormosa_Dead") == TRUE)
        {
            return TRUE;
        }
    }
    return FALSE;
}
