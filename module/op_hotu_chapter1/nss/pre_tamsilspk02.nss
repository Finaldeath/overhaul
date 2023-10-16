// this will ensure that Tamsil doesn't repeat
// her cut-scene dialogue with the PC hero

void main()
{
    SetLocalInt(GetModule(), "Tamsil_Speak", 2);
}
