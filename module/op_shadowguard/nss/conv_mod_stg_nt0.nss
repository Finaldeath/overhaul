// The conv_mod_stg_* scripts check to see what
// stage of the module's story is currently in place,
// and activate the "N_TALK_SWITCH" of the NPC when
// found
// Should NEVER return TRUE

int StartingConditional()
{
    if (GetLocalInt(GetModule(), "N_MODULE_STAGE") != 0)
        SetLocalInt(OBJECT_SELF, "N_TALK_SWITCH", 1);


    return FALSE;
}
