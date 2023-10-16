#include "nw_i0_plot"

int StartingConditional()
{
    //Player agreed to the job
    if (GetLocalInt(GetPCSpeaker(),"NW_FORMOSA_JOB_ACCEPTED") == 2)
    {
        return TRUE;
    }
    //or Player refused the job
    else if (GetLocalInt(GetPCSpeaker(),"NW_FORMOSA_JOB_ACCEPTED") == 1)
    {
        //but player has tooth
        if (GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"M1Q3A00TOOTH")))
        {
            return TRUE;
        }
        //or player has key
        else if (GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"M1Q3A00MELDKEY")))
        {
            return TRUE;
        }
        //or Meldanen is dead
        else if (GetLocalInt(GetModule(),"NW_G_M1Q3MeldDead") == TRUE)
        {
            return TRUE;
        }
        else
        {
        return FALSE;
        }
    }
    else
    {
    return FALSE;
    }
}

