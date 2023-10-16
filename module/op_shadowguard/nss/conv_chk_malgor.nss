//Return TRUE if Malgor's spirit is still present.

int StartingConditional()
{
    object oMalgor = GetObjectByTag("CT_UNIQ_UN_MALG");

    if (GetLocalInt(GetModule(), "N_MODULE_STAGE") == 0)
    {
        if (oMalgor != OBJECT_INVALID)
        {
            return TRUE;
        }
    }

    return FALSE;
}
