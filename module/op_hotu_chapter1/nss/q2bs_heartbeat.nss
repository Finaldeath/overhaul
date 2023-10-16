//Run the gargoyle trap if it is active
void main()
{
//If the Gargoyle Trap is active - run its script
    if ( GetLocalInt(GetModule(), "nQ2BGARGTRAPACTIVE") == 1)
    {
        if (GetLocalInt(GetModule(),"q2bTrapRunning") != 1)
        {
            ExecuteScript("q2b_run_gargtrap", OBJECT_SELF);
        }
    }
    object oPC = GetFirstPC();
}
