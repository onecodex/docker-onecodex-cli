#!/usr/bin/env bats

@test "Python 3 should be installed" {
    V=$(python3 --version 2>&1)
    [[ $V == Python\ 3* ]]
}

@test "Pigz installed" {
    V=$(pigz --version 2>&1)
    [[ $V == pigz* ]]
}

@test "fastq-dump v2.8.0" {
    F=$(fastq-dump --version)
    [[ $F == *2.8.0* ]]
}

@test "AWS CLI" {
    X=$(aws --version 2>&1)
    [[ $X == *aws-cli* ]]
}

@test "One Codex CLI" {
    X=$(onecodex --version 2>&1)
    [[ $X == *onecodex* ]]
}

@test "Join paired ends script exists" {
    X=$(python3 /scripts/join_paired_ends.py --help)
    [[ $X == *Join\ two\ FASTQ\ paired\ end\ read\ files.* ]]
}

@test "Join paired ends script supports interleaving" {
    X=$(python3 /scripts/join_paired_ends.py --help)
    [[ $X == *interleave* ]]
}
