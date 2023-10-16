void main()
{
    if (GetLocalInt(OBJECT_SELF, "X2_ONCE") == 0)
    {
        ExecuteScript("x2_act_coolitem", OBJECT_SELF);
        SetLocalInt(OBJECT_SELF, "X2_ONCE", 10);
    }
}
