RewardRanking_Config = {
    Enable = true,
    Window = 10,
    Package = 12,
    LocalReward = '/npcpremio',
    NameNPC = 'Guardião de Brindes',
    DateRecoveryReward = '03/09/2023',

    ImagesPath = {
        background = "Interface\\bg-ranking-reward.tga",
        btn_reward = "Interface\\btn-retirar.tga",
        btn_view_reward = "Interface\\IGS_Storage_Page_Right.tga"
    },

    ConfigRanking = {
        [1] = { --Ranking Reset
            AmountRanking = 3,
            Reward = {
                [1] = {
                    item = {Section = 14, index = 14, nome = 'Box Of Qualquer Coisa', daysExpire = 30},
                    amount = 30
                },
                [2] = {
                    item = {Section = 14, index = 14, nome = 'Box Of Qualquer Coisa', daysExpire = 30},
                    amount = 20
                },
                [3] = {
                    item = {Section = 14, index = 14, nome = 'Box Of Qualquer Coisa', daysExpire = 30},
                    amount = 10
                }
            }
        },

        [2] = { --Ranking MReset
            AmountRanking = 3,
            Reward = {
                [1] = {
                    item = {Section = 14, index = 14, nome = 'Box Of Qualquer Coisa', daysExpire = 30},
                    amount = 30
                },
                [2] = {
                    item = {Section = 14, index = 14, nome = 'Box Of Qualquer Coisa', daysExpire = 30},
                    amount = 20
                },
                [3] = {
                    item = {Section = 14, index = 14, nome = 'Box Of Qualquer Coisa', daysExpire = 30},
                    amount = 10
                }
            }
        },

        [3] = { --Ranking Mata-Mata
            AmountRanking = 3,
            Reward = {
               [1] = {
                   item = {Section = 14, index = 14, nome = 'Box Of Qualquer Coisa', daysExpire = 30},
                   amount = 30
               },
               [2] = {
                   item = {Section = 14, index = 14, nome = 'Box Of Qualquer Coisa', daysExpire = 30},
                   amount = 20
               },
               [3] = {
                   item = {Section = 14, index = 14, nome = 'Box Of Qualquer Coisa', daysExpire = 30},
                   amount = 10
               }
            }
        },

        [4] = { --Ranking Trade Wins
            AmountRanking = 3,
            Reward = {
               [1] = {
                   item = {Section = 14, index = 14, nome = 'Box Of Qualquer Coisa', daysExpire = 30},
                   amount = 30
               },
               [2] = {
                   item = {Section = 14, index = 14, nome = 'Box Of Qualquer Coisa', daysExpire = 30},
                   amount = 20
               },
               [3] = {
                   item = {Section = 14, index = 14, nome = 'Box Of Qualquer Coisa', daysExpire = 30},
                   amount = 10
               }
            }
        },

        [5] = { --Ranking Blood Castle
            AmountRanking = 3,
            Reward = {
               [1] = {
                   item = {Section = 14, index = 14, nome = 'Box Of Qualquer Coisa', daysExpire = 30},
                   amount = 30
               },
               [2] = {
                   item = {Section = 14, index = 14, nome = 'Box Of Qualquer Coisa', daysExpire = 30},
                   amount = 20
               },
               [3] = {
                   item = {Section = 14, index = 14, nome = 'Box Of Qualquer Coisa', daysExpire = 30},
                   amount = 10
               }
            }
        },

        [6] = { --Ranking Invasão
            AmountRanking = 5,
            Reward = {
                [1] = {
                    item = {Section = 14, index = 14, nome = 'Box Of Qualquer Coisa', daysExpire = 30},
                    amount = 50
                },
                [2] = {
                   item = {Section = 14, index = 14, nome = 'Box Of Qualquer Coisa', daysExpire = 30},
                   amount = 40
                },
                [3] = {
                   item = {Section = 14, index = 14, nome = 'Box Of Qualquer Coisa', daysExpire = 30},
                   amount = 30
                },
                [4] = {
                    item = {Section = 14, index = 14, nome = 'Box Of Qualquer Coisa', daysExpire = 30},
                    amount = 20
                },
                [5] = {
                    item = {Section = 14, index = 14, nome = 'Box Of Qualquer Coisa', daysExpire = 30},
                    amount = 10
                }
            }
        }
    },

    TextsRankings = {
        ['Por'] = {
            [1] = 'Reset',
            [2] = 'MReset',
            [3] = 'Mata-Mata',
            [4] = 'Trade Wins',
            [5] = 'Blood Castle',
            [6] = 'Invasão'
        },

        ['Spn'] = {
            [1] = 'Reset',
            [2] = 'MReset',
            [3] = 'Mata-Mata',
            [4] = 'Trade Wins',
            [5] = 'Blood Castle',
            [6] = 'Invasão'
        },

        ['Eng'] = {
            [1] = 'Reset',
            [2] = 'MReset',
            [3] = 'Mata-Mata',
            [4] = 'Trade Wins',
            [5] = 'Blood Castle',
            [6] = 'Invasão'
        }
    },

    Texts = {
        ['Por'] = {
            [00] = 'Ranking Reward',
            [01] = 'A premiação vai para o %s, utilize o comando %s, para ir até lá',
            [02] = 'Ranking %s',
            [03] = 'Esse ranking premia os %s primeiros lugares',
            [04] = 'Parabéns, clique em retirar para pegar seu premio',
            [05] = 'Você não está nesse ranking',
            [06] = 'Retire seus prêmios até o dia %s',
            [07] = 'Após essa data não será mais possível retirar o prêmio',
            [08] = 'Premiação: %s',
            [09] = '%d° Colocado: %s',
            [10] = 'Premiação: %s',
            [11] = 'Quantidade: %d',
            [12] = 'Você já retirou seu premio',
        },

        ['Spn'] = {
            [00] = 'Ranking Reward',
            [01] = 'A premiação vai para o %s, utilize o comando %s, para ir até lá',
            [02] = 'Ranking %s',
            [03] = 'Esse ranking premia os %s primeiros lugares',
            [04] = 'Parabéns, clique em retirar para pegar seu premio',
            [05] = 'Você não está nesse ranking',
            [06] = 'Retire seus prêmios até o dia %s',
            [07] = 'Após essa data não será mais possível retirar o prêmio',
            [08] = 'Premiação: %s',
            [09] = '%d° Colocado: %s',
            [10] = 'Premiação: %s',
            [11] = 'Quantidade: %d',
            [12] = 'Você já retirou seu premio',
        },

        ['Eng'] = {
            [00] = 'Ranking Reward',
            [01] = 'A premiação vai para o %s, utilize o comando %s, para ir até lá',
            [02] = 'Ranking %s',
            [03] = 'Esse ranking premia os %s primeiros lugares',
            [04] = 'Parabéns, clique em retirar para pegar seu premio',
            [05] = 'Você não está nesse ranking',
            [06] = 'Retire seus prêmios até o dia %s',
            [07] = 'Após essa data não será mais possível retirar o prêmio',
            [08] = 'Premiação: %s',
            [09] = '%d° Colocado: %s',
            [10] = 'Premiação: %s',
            [11] = 'Quantidade: %d',
            [12] = 'Você já retirou seu premio',
        },
    }
}

return RewardRanking_Config