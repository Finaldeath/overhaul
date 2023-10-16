// symptomatic fix for the boss in the Windswept Area not jumping over.
void main()
{
    vector vPos = GetPosition(OBJECT_SELF);
    if(vPos.x > 115.0 && vPos.y > 125.0)
    {
        object oSP = GetWaypointByTag("yj_wp_devil_final_sp");
        ClearAllActions();
        JumpToLocation(GetLocation(oSP));
        DelayCommand(2.0, ExecuteScript("yj_jump_boss", OBJECT_SELF));
    }
}
