void main()
{
    switch (GetUserDefinedEventNumber())
    {
        case 1007:
        {
            SetLocked(GetNearestObjectByTag("M1Q4CockBox"),FALSE);
        }
    }
}
