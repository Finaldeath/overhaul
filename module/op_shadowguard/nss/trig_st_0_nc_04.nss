void main()
{
    object o = GetEnteringObject();

    if (GetTag(o) == "HENCH_TARI")
    {
        SetLocalInt(o, "N_ST_0_TARIN_ESCAPE", 1);
    }
}
