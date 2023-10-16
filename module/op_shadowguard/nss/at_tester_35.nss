void main()
{
    int n = GetLocalInt(OBJECT_SELF, "N_CURR_CHK_VAR");

    SetLocalInt(GetModule(), "N_OKARIS_RACE", n);
}
