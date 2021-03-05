import { Column, Entity } from 'typeorm';
import AbstractEntity from '../core/abstract.entity';

@Entity('projects')
export class Project extends AbstractEntity {
    @Column()
    name: string;
}
